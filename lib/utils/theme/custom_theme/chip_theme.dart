import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: TColors.primaryColor,
    padding: const EdgeInsets.all(12),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: TColors.primaryColor,
    padding: EdgeInsets.all(12),
    checkmarkColor: Colors.white,
  );
}
