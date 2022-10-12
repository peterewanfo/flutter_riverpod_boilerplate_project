import 'package:flutter_riverpod_boilerplate_project/data/services/local/__local.dart';
import 'package:flutter_riverpod_boilerplate_project/handlers/__handlers.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/enums.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({
  String baseApi = "",
  AppFlavor flavor = AppFlavor.debug,
}) async {
  locator.registerSingleton<AppFlavor>(flavor);

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  //Local storage
  locator.registerLazySingleton<SecureStorage>(
    () => SecureStorageImpl(),
  );

  locator.registerLazySingleton<LocalCache>(
    () => LocalCacheImpl(
      sharedPreferences: locator(),
      storage: locator(),
    ),
  );

  //Handlers
  locator.registerLazySingleton<NavigationHandler>(
    () => NavigationHandlerImpl(),
  );

  locator.registerLazySingleton<DialogHandler>(
    () => DialogHandlerImpl(),
  );

  //Repositories
}
