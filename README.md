# Flutter Riverpod Boilerplate Project

This is a boilerplate flutter project created using Riverpod and GetIt. It currently support only Mobile (Tablet and Phone) with both production and staging environment capabilities. You can clone the project using the link below:

* https://github.com/peterewanfo/flutter_riverpod_boilerplate_project

## Getting Started

The Boilerplate contains the minimal implementation required to create a new project. This repository is preloaded with some basic app architecture that can be expanded to to fit in larger project. The purpose of this repository is to help reduce setup and development time and avoid re-writing same code pattern for every app to be created. If you have any suggestions or improvements, feel free 

## Installation

Please note: This repository requires [Flutter](https://flutter.dev/docs/get-started/install) to be installed to your development machine. After that is done, follow the below steps.

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/peterewanfo/flutter_riverpod_boilerplate_project.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

## Packages Used

This repository makes use of the following pub packages:

| Package | Version | Usage |
| ------- | ------- | ------- |
| [Hooks Riverpod](https://pub.dev/packages/hooks_riverpod) | ^1.0.3 | State Management |
| [Flutter Hooks](https://pub.dev/packages/flutter_hooks) | ^0.18.2+1 | Increase the code-sharing between widgets by removing duplicates. |
| [Flutter Lints](https://pub.dev/packages/flutter_lints) | ^1.0.0 | To encourage good coding practices. |
| [Flutter Screenutil](https://pub.dev/packages/flutter_screenutil) | ^5.0.0+2 | For adapting screen and font size |
| [GetIt](https://pub.dev/packages/get_it) | ^7.1.3 | For accessing service objects/Views/AppModels |
| [Connectivity Plus](https://pub.dev/packages/connectivity_plus) | ^2.3.9 | To discover network connectivity |
| [Dartz](https://pub.dev/packages/dartz) | ^0.10.1 | For easy and safe error handling with functional programming stule in Dart |
| [Shared Preference](https://pub.dev/packages/shared_preferences) | ^6.0.0 | To store data as key/value pairs |
| [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) | ^2.0.7 | To store data in secure storage |
| [Flutter dotenv](https://pub.dev/packages/flutter_dotenv) | ^5.0.2 | To manage/read .env files |
| [Pretty Dio Logger](https://pub.dev/packages/pretty_dio_logger) | ^1.1.1 | A [Dio](https://pub.dev/packages/dio) interceptor that logs network calls in a pretty, easy to read format |
| [Dio](https://pub.dev/packages/dio) | ^4.0.4 | Http Client for Dart
| [Another Flushbar](https://pub.dev/packages/another_flushbar) | ^1.12.29 | To substitute toasts and snackbars and introduce more customization when notifying your user.
| [Change App Package Name](https://pub.dev/packages/change_app_package_name) | ^1.1.0 | To change app package name with single command. It makes the process very easy and fast.

### Removing unwanted packages

If any package is not needed, then removing it from [pubspec.yaml](./pubspec.yaml) file as well as all imports and uses should be enough.

### Changing the package and app name

use the [Change App Package Name](https://pub.dev/packages/change_app_package_name) the package is already included in this boilerplate project.
Simply run this command
```
flutter pub run change_app_package_name:main com.new.package.name
```
where "com.new.package.name" is your desired backage name for the project. For other information on how to do this, kindly visit this [Stackoverflow issues](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter/51550358#51550358)

## Boilerplate Features:

* Splash
* Login
* Signup
* Home
* Routing
* Dio
* Database
* Riverpod
* Validation
* Loggin
* Dependency Injection
* Connectivity

### Up-Coming Feature:

* Widget and Unit Test Support
* Robust Example project project

### Folder Structure

```
app-base-directory/
| - android
| - assets
| - build
| - ios
| - lib
| - test
| - .env
| - .env_prod
```

### Assets
This contains static image resources and fonts used in the application<br />
This is what the `assets` file structure looks like

```
assets/
| - fonts
| - images
```

### Lib

Let's see a detailed view on the [lib folder](./lib/)

```
lib/
| - data
| - handlers
| - models
| - presentation
| - utils
| - app.dart
| - main.prod.dart
| - main.dart
```

Here is a brief description of what is contained in each folder

```
1: data - includes directories for network calls and shared preferences
2: handlers - contains navigation handler and dialog manager/handler for managing dialogs and application navigation at a global level.
3: models - contains data models of your application
4: presentation - contains your application UI(Views), ViewModels, custom styles, defined routes and custom designed widgets.
5: app.dart - in here we load the application and set flag for staging or production based on the current active app flavour
6. main.dart - this is the app main lancher and uses the staging app flavour
7. main.prod.dart - this is the production main lancher and uses the production app flavour
```
for more explanation on app flavour and it is setup in a project, [checkout this youtube video](https://www.youtube.com/watch?v=Vhm1Cv2uPko) or [this article](https://codewithandrea.com/articles/flutter-flavors-for-firebase-apps/)


Now let's dive deep exhausively into each folder and see what each entails.

### Data

This contains the data layer of your project. It is home to all your application business logic. From here, your application gets all resources it needs to best serve the user, this includes network resources (api calls) and local resources (sharepreferences or secure storage) as prefered. This is what the `data` file structure looks like

```
data/
| - config
    | - base_api.dart
| - services
    | - local
        __local.dart
        | - implementations
            | - secure_storage_impl.dart
            | - shared_preference_impl.dart
        | - repositories
            | - secure_storage_repository.dart
            | - shared_preference_repository.dart
    | - remote
        __remote.dart
        | - implementations
            | - user_repository_impl.dart
        | - repositories
            | - user_repository.dart
```

Like you have noticed, this repository provides implementation for both Flutter secure storage and shared preference, while both does thesame task of keeping data to the device, the former encrypts data stored, the latter doesnt.
You can check [this article](https://medium.com/@mustafatahirhussein/shared-preferences-or-flutter-secure-storage-which-is-better-to-use-e6b6a0a4fcfc) on how both works and decide which to use, like said earlier both implementations are available in this repository, ready for you to decide.


### Handlers

This contains manager/handler for managing dialogs and application navigation at a global level. with this, we're making provisions to enable navigations and dialog pop-up from anywhere in our application either in views/viewmodel/custom functional methods e.t.c. Learn more about this from these amazing blog posts

* [Blog post 1](https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a)<br />
* [Blog post 2](https://medium.com/@devcrazelu/lets-a-build-custom-flutter-dialog-handler-feeb6e2acbf3)<br />

Special thanks to the creators.<br />
This is what the `handlers` file structure looks like

```
handlers/
| - __handlers.dart
| - dialog_handler.dart
| - navigation_handler.dart
```

### File naming convention to note
1. "__folder_name.dart" In every folder, there is a file named "__folder_name.dart". The purpose of this file is to enable export multiple dart files from just one. This is extensively used in the project for example in the `handlers` folder above, there exist the file named `__handlers.dart`
*sample __handlers.dart
```dart
export dialog_handler.dart;
export navigation_handler.dart;
```
now importing `__handlers.dart` also imports `dialog_handler.dart` and `navigation_handler.dart`

For more explanations and examples on how this works, checkout [this article](https://betterprogramming.pub/how-to-export-multiple-dart-files-from-just-one-b2f2964029e)


### Models

On here is where all model classes for our application is created. It can be further split into folders like `api`, just to differentiate model classes created.

### Presentation

This contains the following sub folders `custom_designs`, `routes`, `style`, `view_models`, `views`. This is what the `presentation` file structure looks like

Here is a brief description of what is contained in each folder

1: custom_designs - This contains all custom and shared widgets.

2: routes - This contains two files `routes.dart` and `route_generator.dart`. The former contains all routes to your application while the latter, contains custom route generator callback for all routes in your application.
The structure looks like this

```
presentation/
| - routes
    | - __routes.dart
    | - route_generator.dart
    | - routes.dart
```

*Sample routes.dart
```dart
class Routes {
  static const splashScreenView = "/splashScreenView";
  static const signupView = "/signupView";
  static const loginView = "/loginView";
}
```

*Sample route_generator.dart
```dart

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash_screen:
        return _getPageRoute(SplashScreen(), settings);
      default:
        return _getPageRoute(_errorPage());
    }

    static CupertinoPageRoute _getPageRoute(
        Widget child, [
        RouteSettings settings = const RouteSettings(),
        bool? isfullScreenDialog = false,
        ]
    ) => CupertinoPageRoute(
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
                style: TextStyle(color: Colors.red),
              )),
              body: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            )
          : const SizedBox();
```

3: style - This contains application styling including `app_theme.dart`, `custom_colors.dart`
The structure looks like this

```
presentation/
| - style
    | - __style.dart
    | - app_theme.dart
    | - custom_colors.dart
    | - custom_style.dart
```

4: view_models - In reference to an amazing article by Jitesh Mohite on "Flutter: MVVM Architecture". ViewModel is the mediator between View and Model.
It's from here we handle all user events, fetch data required and notify the view. If you wish to learn more about MVVM, you can checkout this amazing article ["Flutter: MVVM Architecture"](https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958)

5: views - This directory contains all the UI of your application.

### Handling Mobile and Tablet view compatibility

For View responsiveness across mobile and tablet, we use Layout builder to determine which view version to launch based on device width. contained in this boilerplate is a custom layout builder to handle this functionality for all views.

* sample code - `responsive_laout.dart`
```dart
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? tablet;
  final Widget mobile;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) {
        if (constraint.maxWidth <= 488) return mobile;
        return tablet ?? mobile;
      },
    );
  }
}
```

* To use this functionality, other views can then be structure like below.
```
views/
| - login
    | - login_mobile_view.dart
    | - login_tablet_view.dart
    | - login_view.dart
```
In `login_view.dart`, we import `responsive_laout.dart` and pass as parameters the different views( `login_mobile_view.dart` and `login_tablet_view.dart` )

* sample code - `login_view.dart`
```dart
import 'package:flutter/material.dart';
import 'package:boilerplate_project/presentation/custom_designs/responsive_layout.dart';
import 'package:boilerplate_project/presentation/views/login_mobile_view.dart';
import 'package:boilerplate_project/presentation/views/login_tablet_view.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LoginMobileView(),
      tablet: LoginTabletView(),
    );
  }
}

```

### Utils

This direcctory is used as the helper folder of the application. It contains the following files: 
1.  `api_endpoints.dart`: Here, you keep all api endpoints called in your application.
*sample code - `api_endpoints.dart`
```dart
class ApiEndpoints {
  static const login = "/login";
  static const signUp = "/sign_up";
}
```

2.  `app_strings.dart`: Here we keep string constants used in your application. It could either be keys to shared preferences e.t.c
*sample code - `app_strings.dart`
```dart
class AppStrings {
  AppStrings._();

  //SHARE PREFERENCE STRINGS
  static const accessTokenPref = "access_token_pref";
  static const refreshTokenPref = "refresh_token_pref";

}
```

3.  `connection_status.dart`: This helper file contains class that tells if your application has internet connection.
*sample code - `connection_status.dart`

```dart
import 'package:connectivity/connectivity.dart';

class ConnectionStatus {
  static Future<bool> isConnected() async {
    var connectionResult = await (Connectivity().checkConnectivity());

    if (connectionResult == ConnectivityResult.mobile)
      return true;
    else if (connectionResult == ConnectivityResult.wifi)
      return true;
    else {
      return false;
    }
  }
}
```

4.  `enums.dart`: This file contains all enums used in your applications.

5.  `extensions.dart`: This file contains extensions to add functionality to widgets and libraries preventing code repitition.

6.  `validators.dart`: This file contain custom form validators used in your application.

7.  `locator.dart`: This file contains the configuration of getIt service locator used in this boilerplate.<br />
* More Explanation - In here we register shared preferences and custom app flavour as singleton and other classes used as lazy singleton. The purpose of lazy singleton is for initializing resources at the time of the first request instead at the time of declaration.

*sample code - `locator.dart`
```dart
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
}
```

8.  `logger.dart`: From here, we toggle logs 'on' when on debug mode and off when in production

*sample code - `logger.dart`
```dart
import 'dart:developer' as dev;

class AppLogger {
  AppLogger._();

  static bool _showLogs = false;
  static bool get showLogs => _showLogs;

  static void setLogger({required bool showLogs}) {
    _showLogs = showLogs;
  }

  static void log(Object? e) {
    if (_showLogs) dev.log("$e");
  }
}
```

9.  `env_config.dart`: This contains method to load different environment variables used in your application. These environment file (`.env` and `.env_prod`) is located in the applicationn project folder. These files are added to gitignore so you should create them manually after cloning this boilerplate project.

* sample code - `env_config.dart`

```dart
import 'package:boilerplate_project/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

```

### Contribution
If you wish to contribute to this boilerplate project, please feel free to submit an issue and/or pull request.

Thanks for your time.