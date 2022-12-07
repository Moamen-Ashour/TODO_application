import 'package:flutter/material.dart';
import 'colors.dart';

class ThemeOfData {
  static ThemeData LightTheme = ThemeData(
      primaryColor: PRIMARY_COLOR,
      scaffoldBackgroundColor: GREEN_BACKGROUND,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: PRIMARY_COLOR,
          onPrimary: Colors.white,
          secondary: GREEN_BACKGROUND,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: GREEN_BACKGROUND,
          onBackground: PRIMARY_COLOR,
          surface: Colors.grey,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: PRIMARY_COLOR,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
              fontSize: 20, color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              fontSize: 20, color: COLOR_GREEN, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: Colors.grey,
        // type: BottomNavigationBarType.fixed
      )
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //    selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.white,
      //     // backgroundColor: colorGold,
      //   ),
      );

  static ThemeData DarkTheme = ThemeData(
      primaryColor: DARK_PRIMARY_COLOR,
      scaffoldBackgroundColor: DARK_BLUE_BACKGROUND,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: DARK_PRIMARY_COLOR,
          onPrimary: Colors.white,
          secondary: DARK_BLUE_BACKGROUND,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: DARK_BLUE_BACKGROUND,
          onBackground: DARK_PRIMARY_COLOR,
          surface: Colors.white,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: DARK_PRIMARY_COLOR,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
              fontSize: 20,
              color: DARK_PRIMARY_COLOR,
              fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              fontSize: 20, color: COLOR_GREEN, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: DARK_PRIMARY_COLOR,
        unselectedItemColor: DARK_COLOR_GREY,
        // type: BottomNavigationBarType.fixed
      )
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //    selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.white,
      //     // backgroundColor: colorGold,
      //   ),
      );
}
