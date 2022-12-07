import 'package:flutter/material.dart';
import 'shared/styles/ThemeOfData.dart';
import 'layout/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeOfData.LightTheme,
      darkTheme: ThemeOfData.DarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
