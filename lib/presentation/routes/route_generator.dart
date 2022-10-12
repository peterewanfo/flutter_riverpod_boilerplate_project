import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/routes/routes.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/views/login/login_view.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/views/signup/signup_view.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/views/splash_screen_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreenView:
        return _getPageRoute(SplashScreen(), settings);
      case Routes.loginView:
        return _getPageRoute(LoginView(), settings);
      case Routes.signupView:
        return _getPageRoute(SignupView(), settings);
      default:
        return _getPageRoute(_errorPage());
    }
  }

  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    RouteSettings settings = const RouteSettings(),
    bool? isfullScreenDialog = false,
  ]) =>
      CupertinoPageRoute(
        builder: (context) => child,
        fullscreenDialog: isfullScreenDialog ?? false,
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

  static Widget _errorPage({String message = "Error! Page not found"}) =>
      kDebugMode
          ? Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Page not found',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              body: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            )
          : const SizedBox();
}
