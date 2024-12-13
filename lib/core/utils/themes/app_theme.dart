import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_colors.dart';

class AppTheme {
  static const plusJakartaSans = 'PlusJakartaSans';



  //? light text mode
  static TextTheme lightTextTheme = const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ),
      displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ));

  //? dark text mode
  static TextTheme darkTextTheme = const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontFamily: plusJakartaSans,
      ));

  //? light Mode
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) => Colors.black),
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black, backgroundColor: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.green),
      textTheme: lightTextTheme,
    );
  }
}