import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      border: OutlineInputBorder(),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(_decideColor),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }

  static Color? _decideColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return Colors.grey;
    } else {
      return Colors.deepPurple;
    }
  }
}
