import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 239, 239, 244),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: const Color.fromARGB(255, 239, 239, 244),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      textColor: Colors.black,
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
      surfaceTintColor: Color.fromARGB(255, 139, 135, 135),
      elevation: 1,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    useMaterial3: true,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 39, 39, 44),
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      background: const Color.fromARGB(255, 39, 39, 44),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      textColor: Colors.white,
      backgroundColor: Colors.black,
      collapsedBackgroundColor: Colors.black,
    ),
    // Change inkWell color
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
      surfaceTintColor: Colors.black,
      elevation: 1,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    useMaterial3: true,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.black,
    ),
  );
}
