import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod_boilerplate_project/models/api_error_response.dart';

class Success with EquatableMixin {
  final Map<String, dynamic> data;

  Success(this.data);

  @override
  List<Object?> get props => [data];
}
