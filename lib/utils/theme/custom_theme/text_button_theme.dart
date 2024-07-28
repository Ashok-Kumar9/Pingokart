import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(0),
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return TColors.grey;
          }
          return TColors.primaryColor;
        },
      ),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          );
        },
      ),
    ),
  );
}
