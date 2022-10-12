import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod_boilerplate_project/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'utils/__utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvFile();

  final baseUrl = dotenv.env['baseUrl']!;
  await setupLocator(
    baseApi: baseUrl,
  );
  AppLogger.setLogger(showLogs: false);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (val) {
      runApp(
        ProviderScope(
          child: App(
            isProduction: true,
          ),
        ),
      );
    },
  );
}
