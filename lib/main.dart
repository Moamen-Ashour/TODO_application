import 'package:coach_nearest/models/list_settings_provider.dart';
import 'package:coach_nearest/modules/settings/setting.dart';
import 'package:coach_nearest/modules/splash_screen/splash_screen_animated.dart';
import 'package:coach_nearest/modules/task_list/taskList.dart';
import 'package:flutter/material.dart';
import 'shared/styles/ThemeOfData.dart';
import 'layout/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) => list_settings_provider(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash_Screen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Splash_Screen.routeName: (_) => Splash_Screen(),
        Setting_Tab.routeName: (_) =>Setting_Tab(),
        Task_List_Tab.routeName:(_)=>Task_List_Tab()


      },
      debugShowCheckedModeBanner: false,
      theme: ThemeOfData.LightTheme,
      darkTheme: ThemeOfData.DarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
