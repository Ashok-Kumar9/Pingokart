import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/theme/custom_theme/appbar_theme.dart';
import 'package:pingokart/utils/theme/custom_theme/chip_theme.dart';
import 'package:pingokart/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:pingokart/utils/theme/custom_theme/text_button_theme.dart';
import 'package:pingokart/utils/theme/custom_theme/text_field_theme.dart';
import 'package:pingokart/utils/theme/custom_theme/text_theme.dart';

import 'custom_theme/bottom_sheet_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: TColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightEleButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: TChipTheme.lightChipTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.textButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: TColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkEleButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.textButtonTheme,
  );
}
