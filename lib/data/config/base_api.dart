import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod_boilerplate_project/data/services/local/__local.dart';
import 'package:flutter_riverpod_boilerplate_project/models/__models.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseApi {
  late Dio dio;

  late String getBaseUrl;

  BaseApi(String baseApi) {
    final options = BaseOptions(
      baseUrl: "",
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 60 * 1000, // 60 seconds
    );

    getBaseUrl = baseApi;

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (
        options,
        handler,
      ) async {
        //no internet? reject request
        if (!await ConnectionStatus.isConnected()) {
          handler.reject(
            DioError(
              requestOptions: options,
              error:
                  "Oops! Looks like you're not connected to the internet. Check your internet connection and try again.",
            ),
          );
        }

        handler.next(options);
      }, onResponse: (response, handler) async {
        handler.next(response);
      }, onError: (error, handler) async {
        handler.next(error);
      }),
    );
    if (kDebugMode && AppLogger.showLogs) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> getAuthorizedHeader(
      {bool useRefreshToken = false}) async {
    var access_token = await locator<LocalCache>()
        .getFromLocalCache(AppStrings.accessTokenPref);
    var refresh_token =
        locator<LocalCache>().getFromLocalCache(AppStrings.refreshTokenPref);

    var access_data = {
      "Authorization": "Bearer " + access_token.toString(),
    };

    var refresh_data = {
      "Authorization": "Bearer " + refresh_token.toString(),
    };

    if (useRefreshToken) {
      return refresh_data;
    } else {
      return access_data;
    }
  }

  Future<Either<Failure, Success>> get(
    path, {
    bool useToken = false,
    Map<String, dynamic>? data,
    Map<String, dynamic> headers = const {},
  }) async {
    var authorizedHeader = {};
    if (useToken) {
      authorizedHeader = await getAuthorizedHeader();
    }
    return makeRequest(
      dio.request(
        "$path",
        data: data,
        options: Options(
          method: "GET",
          headers: {
            ...headers,
            ...authorizedHeader,
          },
        ),
      ),
    );
  }

  Future<Either<Failure, Success>> post(
    path, {
    bool useToken = false,
    bool useRefreshToken = false,
    dynamic data,
    Map<String, dynamic> headers = const {},
  }) async {
    var authorizedHeader = {};
    if (useToken) {
      authorizedHeader =
          await getAuthorizedHeader(useRefreshToken: useRefreshToken);
    }
    return makeRequest(dio.post(
      "$path",
      data: data,
      options: Options(
        headers: {
          ...headers,
          ...authorizedHeader,
        },
      ),
    ));
  }

  Future<Either<Failure, Success>> put(
    path, {
    Map<String, dynamic>? data,
    Map<String, dynamic> headers = const {},
    bool useToken = false,
    bool useRefreshToken = false,
  }) async {
    var authorizedHeader = {};
    if (useToken) {
      authorizedHeader =
          await getAuthorizedHeader(useRefreshToken: useRefreshToken);
    }
    return makeRequest(
      dio.put(
        "$path",
        data: data,
        options: Options(
          headers: {
            ...headers,
            ...authorizedHeader,
          },
        ),
      ),
    );
  }

  Future<Either<Failure, Success>> delete(
    path, {
    bool useToken = false,
    Map<String, dynamic>? data,
    Map<String, dynamic> headers = const {},
  }) async {
    var authorizedHeader = {};
    if (useToken) {
      authorizedHeader = await getAuthorizedHeader();
    }
    return makeRequest(
      dio.delete(
        "$path",
        data: data,
        options: Options(
          headers: {
            ...headers,
            ...authorizedHeader,
          },
        ),
      ),
    );
  }

  Future<Either<Failure, Success>> makeRequest(Future<Response> future) async {
    try {
      var req = await future;

      var data = req.data;

      AppLogger.log(data);

      if ("${req.statusCode}".startsWith('2')) {
        return Right(Success(data));
      } else {
        return Left(
          Failure(
            ApiErrorResponse(
              message: ParserUtil.parseJsonString(data, "message"),
              data: data,
              errorCode: req.statusCode,
            ),
          ),
        );
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.other) {
        return Left(
          Failure(
            const ApiErrorResponse(
              data: {},
              message: "Oops. Check your internet connection and try again.",
            ),
          ),
        );
      }

      if (e.response != null) {
        if (e.response?.statusCode == 404) {
          return Left(
            Failure(
              const ApiErrorResponse(
                  message: "Resource not found", errorCode: 404),
            ),
          );
        }

        if (e.response?.statusCode == 401) {
          return Left(
            Failure(
              const ApiErrorResponse(
                  message: "Session expired", errorCode: 401),
            ),
          );
        }

        if (e.response?.data != null && e.response!.data is Map) {
          return Left(Failure.fromMap(e.response!.data));
        }

        return Left(
          Failure(
            ApiErrorResponse(
              message: e.message,
              errorCode: e.response?.statusCode,
            ),
          ),
        );
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return Left(Failure(
          ApiErrorResponse(
            message: e.message,
            errorCode: e.response?.statusCode,
          ),
        ));
      }
    }
  }
}
