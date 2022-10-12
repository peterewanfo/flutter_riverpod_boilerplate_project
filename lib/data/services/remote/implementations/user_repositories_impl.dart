import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod_boilerplate_project/data/services/local/__local.dart';
import 'package:flutter_riverpod_boilerplate_project/data/services/remote/__remote.dart';
import 'package:flutter_riverpod_boilerplate_project/models/__models.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';
import '../../../config/base_api.dart';

class UserRepositoriesImpl extends BaseApi implements UserRepository {
  late LocalCache cache;

  UserRepositoriesImpl(
    String baseApi, {
    required this.cache,
  }) : super(baseApi);

  @override
  Future<String> getBaseURl() async {
    return getBaseUrl;
  }

  @override
  Future<GeneralResponse> signIn(String username, String password) async {
    var requestData = {
      "username": username,
      "password": password,
    };

    // print("---{----" + requestData.toString());

    var res = await post(ApiEndpoints.login, data: requestData);

    return GeneralResponse.fromJson(res);
  }
}
