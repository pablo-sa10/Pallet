import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        titleTextStyle: TextStyle(
            color: AppColors.textoPreto,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: AppColors.textoPreto)),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textoPreto),
      headlineMedium: TextStyle(fontSize: 20, color: AppColors.textoPreto),
      headlineSmall: TextStyle(fontSize: 16, color: AppColors.textoPreto),
      titleSmall: TextStyle(fontSize: 24, color: AppColors.textoPreto),
      titleMedium: TextStyle(fontSize: 20, color: AppColors.textoPreto),
      bodySmall: TextStyle(fontSize: 16, color: AppColors.textoPreto),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.vermelhoTaramps,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.vermelhoTaramps),
    iconTheme: const IconThemeData(color: AppColors.textoPreto),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.vermelhoTaramps,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorDark,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColorDark,
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
      headlineMedium: TextStyle(fontSize: 20, color: AppColors.textoBranco),
      headlineSmall: TextStyle(fontSize: 16, color: AppColors.textoBranco),
      titleSmall: TextStyle(fontSize: 24, color: AppColors.textoBranco),
      titleMedium: TextStyle(fontSize: 20, color: AppColors.textoBranco),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.vermelhoTaramps,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.vermelhoTaramps),
    iconTheme: const IconThemeData(color: AppColors.textoBranco),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.vermelhoTaramps,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
