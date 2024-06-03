import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        titleTextStyle: TextStyle(
            color: AppColors.textoBranco,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: AppColors.textoBranco)),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textoPreto),
      headlineMedium: TextStyle(fontSize: 16, color: AppColors.textoPreto),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.backgroundColor),
    iconTheme: const IconThemeData(color: AppColors.textoPreto),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        titleTextStyle: TextStyle(
            color: AppColors.textoBranco,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: AppColors.textoBranco)),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textoBranco),
      headlineMedium: TextStyle(fontSize: 16, color: AppColors.textoBranco),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.backgroundColor),
    iconTheme: const IconThemeData(color: AppColors.textoBranco),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
