import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/logger.dart';

Future<void> loadEnvFile({String path = ".env"}) async {
  try {
    await dotenv.load(fileName: path);
  } catch (e) {
    AppLogger.log(e);
  }
}

Future<void> loadProdEnvFile({String path = ".env_prod"}) async {
  try {
    await dotenv.load(fileName: path);
  } catch (e) {
    AppLogger.log(e);
  }
}

Future<void> loadStagingEnvFile({String path = ".env_staging"}) async {
  try {
    await dotenv.load(fileName: path);
  } catch (e) {
    AppLogger.log(e);
  }
}
