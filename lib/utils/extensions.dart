// This file defines helper methods by using extension on specific dart/flutter classes eg:

import 'package:flutter/material.dart';

extension StringExtensions on String {
  String get png => "assets/images/$this.png";
  String get svg => "assets/images/$this.svg";
  String get jpg => "assets/images/$this.jpg";
  String get json => "assets/images/$this.json";
  String get capitalize =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;
  String get allInCaps => toUpperCase();
  String get titleCase => split(' ').map((str) => str.capitalize).join(' ');
  int get toHexColor =>
      int.parse("FF" + this.toUpperCase().replaceAll("#", ""), radix: 16);
}

extension InkWellExtensions on InkWell {
  InkWell get noShadow => InkWell(
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: child,
      );
}
