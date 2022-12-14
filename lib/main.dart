import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_nearest/models/list_settings_provider.dart';
import 'package:coach_nearest/modules/settings/setting.dart';
import 'package:coach_nearest/modules/splash_screen/splash_screen_animated.dart';
import 'package:coach_nearest/modules/task_list/taskList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'models/Providers/select_date_provider.dart';
import 'models/Translate_Application/applivatio_translation.dart';
import 'shared/styles/ThemeOfData.dart';
import 'layout/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // to make a DB locale
  // await FirebaseFirestore.instance.disableNetwork();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) { return list_settings_provider();}),
          ChangeNotifierProvider(create: (context) { return select_date();}),
  ],
  child: MyApp()),

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en',),
        Locale('ar',),
      ],
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      initialRoute: Splash_Screen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Splash_Screen.routeName: (_) => Splash_Screen(),
        Setting_Tab.routeName: (_) =>Setting_Tab(),
        Task_List_Tab.routeName:(_)=>Task_List_Tab()


      },
      debugShowCheckedModeBanner: false,
      // theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
