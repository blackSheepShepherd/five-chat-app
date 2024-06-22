import 'package:flutter/material.dart';

class GlobalThemData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      fontFamily: 'Nunito',
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFF6A96B),
    onPrimary: Color(0xFF171515),
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color.fromARGB(217, 246, 170, 107),
    onPrimary: Colors.white,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Colors.white,
    surface: Color(0xFF07030F),
    error: Color.fromARGB(184, 255, 82, 82),
    onError: Colors.white,
    onSurface: Color.fromARGB(188, 255, 255, 255),
    brightness: Brightness.dark,
  );
}
