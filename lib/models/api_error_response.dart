import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';

class ApiErrorResponse extends Equatable {
  final String message;
  final Map<String, dynamic>? data;
  final int? errorCode;

  const ApiErrorResponse({
    required this.message,
    this.data,
    this.errorCode,
  });

  @override
  List<Object?> get props => [
        message,
        data,
        errorCode,
      ];
}

class Failure with EquatableMixin {
  final ApiErrorResponse error;

  Failure(this.error);

  factory Failure.fromMap(Map<String, dynamic> json) {
    return Failure(
      ApiErrorResponse(
        message: getErrorMessage(
          json['message'],
        ),
        data: json,
      ),
    );
  }

  static String getErrorMessage(Object message) {
    if (message is List<String> && message.isNotEmpty) {
      return message.first;
    }
    if (message is String) return message;
    return "Something went wrong, try again !!!";
  }

  @override
  List<Object?> get props => [error];
}
