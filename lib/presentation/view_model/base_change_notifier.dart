import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod_boilerplate_project/data/services/local/__local.dart';
import 'package:flutter_riverpod_boilerplate_project/handlers/__handlers.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';
import '../../data/services/remote/repositories/user_repositories.dart';

class BaseChangeNotifier extends ChangeNotifier {
  late NavigationHandler navigationHandler;
  late DialogHandler dialogHandler;
  late UserRepository userRepository;
  late LocalCache localCache;

  BaseChangeNotifier({
    NavigationHandler? navigationHandler,
    DialogHandler? dialogHandler,
    UserRepository? userRepository,
    LocalCache? localCache,
  }) {
    this.dialogHandler = dialogHandler ?? locator();
    this.navigationHandler = navigationHandler ?? locator();
    this.userRepository = userRepository ?? locator();
    this.localCache = localCache ?? locator();
  }

  bool _isloading = false;

  bool get isLoading => _isloading;

  set isLoading(bool isloading) {
    _isloading = isloading;
    notifyListeners();
  }

  handleError({String? message}) async {
    dialogHandler.showCustomToastDialog(
      message ?? "Error Occured",
    );
  }
}
