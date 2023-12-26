import 'package:flutter/material.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: secondaryShade3,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: primaryShade3,
      textStyle: bodyBold.copyWith(
        color: whiteColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    outlineBorder: BorderSide(),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 0.5,
        color: Color(0xffcccccc),
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(),
    ),
    errorBorder: UnderlineInputBorder(),
  ),
  scaffoldBackgroundColor: accentColor,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      side: BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: primaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primaryColor,
  ),
);
