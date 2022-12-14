import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData lightTheme() {
  TextTheme lightTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontSize: 22.0,
        color: Colors.black
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: lightTextTheme(base.textTheme),
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
          backgroundColor: Colors.blueAccent,
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

       selectedIconTheme: IconThemeData(color: Colors.white)
        // type: BottomNavigationBarType.fixed
      )
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //    selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.white,
      //     // backgroundColor: colorGold,

      );
}

ThemeData darkTheme() {
  TextTheme darkTextTheme(TextTheme base2) {
    return base2.copyWith(
      headline1: base2.headline1!.copyWith(
        fontSize: 22.0,
        color: Colors.white,
      ),
    );
  }

  final ThemeData base2 = ThemeData.dark();
  return base2.copyWith(

      textTheme: darkTextTheme(base2.textTheme),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: DARK_PRIMARY_COLOR,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: DARK_PRIMARY_COLOR,
          secondary: DARK_BLUE_BACKGROUND,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: DARK_PRIMARY_COLOR,
          onBackground: DARK_PRIMARY_COLOR,
          surface: DARK_PRIMARY_COLOR,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: DARK_BLUE_BACKGROUND,
          iconTheme: IconThemeData(color: DARK_BLUE_BACKGROUND)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: DARK_BLUE_BACKGROUND,
        selectedItemColor: GREEN_BACKGROUND,
        unselectedItemColor: Colors.black,
        // type: BottomNavigationBarType.fixed
      )
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //    selectedItemColor: Colors.black,
    //     unselectedItemColor: Colors.white,
    //     // backgroundColor: colorGold,
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //    selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.white,
      //     // backgroundColor: colorGold,
      //   ),
      );
}

//
//   //   ),
//   );
//
//
//
//
//
//   static ThemeData DarkTheme = ThemeData(
//       primaryColor: DARK_PRIMARY_COLOR,
//       scaffoldBackgroundColor: DARK_BLUE_BACKGROUND,
//       colorScheme: ColorScheme(
//           brightness: Brightness.light,
//           primary: DARK_PRIMARY_COLOR,
//           onPrimary: Colors.white,
//           secondary: DARK_BLUE_BACKGROUND,
//           onSecondary: Colors.white,
//           error: Colors.red,
//           onError: Colors.white,
//           background: DARK_BLUE_BACKGROUND,
//           onBackground: DARK_PRIMARY_COLOR,
//           surface: Colors.white,
//           onSurface: Colors.white),
//       appBarTheme: AppBarTheme(
//           backgroundColor: DARK_PRIMARY_COLOR,
//           iconTheme: IconThemeData(color: Colors.white)),
//       textTheme: TextTheme(
//           headline1: TextStyle(
//               fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
//           subtitle1: TextStyle(
//               fontSize: 20,
//               color: DARK_PRIMARY_COLOR,
//               fontWeight: FontWeight.bold),
//           subtitle2: TextStyle(
//               fontSize: 20, color: COLOR_GREEN, fontWeight: FontWeight.bold)),
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: Colors.white,
//         selectedItemColor: DARK_PRIMARY_COLOR,
//         unselectedItemColor: DARK_COLOR_GREY,
//         // type: BottomNavigationBarType.fixed
//       )
//       // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       //    selectedItemColor: Colors.black,
//       //     unselectedItemColor: Colors.white,
//       //     // backgroundColor: colorGold,
//       //   ),
//       );
// }
