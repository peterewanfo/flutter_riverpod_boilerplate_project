import 'dart:io';

import 'package:flutter_riverpod_boilerplate_project/models/__models.dart';

abstract class UserRepository {
  Future<String> getBaseURl();

  Future<GeneralResponse> signIn(
    String username,
    String password,
  );
}
