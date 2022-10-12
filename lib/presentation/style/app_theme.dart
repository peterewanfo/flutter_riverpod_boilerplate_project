import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate_project/presentation/style/__style.dart';
import 'package:flutter_riverpod_boilerplate_project/utils/__utils.dart';

class AppTheme {
  static final defaultAppTheme = ThemeData(
    scaffoldBackgroundColor: CustomColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      color: CustomColors.backgroundColor,
      elevation: 1,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: CustomColors.blackColor),
      actionsIconTheme: IconThemeData(color: CustomColors.blackColor),
    ),
    toggleableActiveColor: CustomColors.blackColor,
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      button: CustomStyle.textStyleBody,
      subtitle1: CustomStyle.textStyleBody,
      subtitle2: CustomStyle.textStyleBody,
      bodyText1: CustomStyle.textStyleBody,
      bodyText2: CustomStyle.textStyleBody,
      headline6: CustomStyle.textStyleBody,
    ),
    canvasColor: Colors.transparent,
    iconTheme: const IconThemeData(color: CustomColors.blackColor),
    fontFamily: AppStrings.appFont,
  );
}
