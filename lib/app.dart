import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod_boilerplate_project/handlers/__handlers.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/style/__style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'presentation/routes/__routes.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';
import 'utils/__utils.dart';

class App extends StatefulWidget {
  bool isProduction;

  App({
    Key? key,
    required this.isProduction,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isProduction = widget.isProduction;
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Boilerplate Project',
        theme: AppTheme.defaultAppTheme,
        initialRoute: Routes.splashScreenView,
        navigatorKey: locator<NavigationHandler>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: (context, widget) {
          return Navigator(
            onGenerateRoute: (settings) => CupertinoPageRoute(
              builder: (context) => DialogManager(
                child: isProduction
                    ? widget!
                    : Banner(
                        message: 'Staging',
                        location: BannerLocation.topEnd,
                        child: widget!,
                      ),
              ),
            ),
          );
        },
        supportedLocales: const [
          Locale("en"),
        ],
      ),
    );
  }
}
