import 'package:flutter/material.dart';

import 'pallete.dart';

class ThemeFactory {
  static ThemeData fbTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Pallete.greenPrimary,
      secondaryHeaderColor: Colors.black,
      accentColor: Pallete.bluePrimary,
      textTheme: fbTextTheme(context),
    );
  }

  static TextTheme fbTextTheme(BuildContext context) {
    return Typography.englishLike2018;
  }
}
