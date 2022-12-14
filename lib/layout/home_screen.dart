import 'package:coach_nearest/models/list_settings_provider.dart';
import 'package:coach_nearest/modules/New_Task/add_new_task.dart';
import 'package:coach_nearest/modules/settings/setting.dart';
import 'package:coach_nearest/modules/task_list/taskList.dart';
import 'package:coach_nearest/shared/styles/ThemeOfData.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../modules/task_added_screen/task_added_screen.dart';
import '../shared/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 2;

  int CurrentIndex = 0;

  List<Widget> ToDoScreens = [
    Task_List_Tab(),
    task_added_screen(),
    Setting_Tab(),
    Setting_Tab()
  ];

  bool itsDark = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<list_settings_provider>(context);

    final items = <Widget>[
      Icon(
        Icons.list,
        size: 30,
      ),
      Icon(Icons.add, size: 30),
      GestureDetector(
          onDoubleTap: () {
            Get.changeTheme(lightTheme());
            itsDark = false;
    var snackBar = SnackBar(
      backgroundColor: GREEN_BACKGROUND,
    content: Text('One Click To Dark Mode!'.tr,style: TextStyle(color: Colors.black),),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

            },
          onTap: () {
            Get.changeTheme(darkTheme());
            itsDark = true;
            var snackBar = SnackBar(
              backgroundColor: GREEN_BACKGROUND,
              content: Text('Double Click To Light Mode!'.tr,style: TextStyle(color: Colors.amber),),);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          },
          child: itsDark == true
              ? Icon(Icons.dark_mode_outlined, size: 30)
              : Icon(Icons.sunny, size: 30)),
      Icon(Icons.settings, size: 30),
    ];

    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: GREEN_BACKGROUND,
          body: ToDoScreens[index],
          appBar: AppBar(
            title: Text("ToDo List".tr),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(
                  color:itsDark ? Colors.white : Colors.blue)
            ),
            child: CurvedNavigationBar(
              color: itsDark ? Colors.black : Colors.white,
              backgroundColor: itsDark ? GREEN_BACKGROUND : GREEN_BACKGROUND,
                buttonBackgroundColor: itsDark ? Colors.blueGrey : Color(0xfffdf6e4),
                key: navigationKey,
                animationDuration: Duration(milliseconds: 600),
                animationCurve: Curves.easeInOut,
                items: items,
                height: 60,
                index: index,
                onTap: (index) {
                  setState(() {
                    this.index = index;
                  });
                  if (this.index == 1) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => add_new_task());
                  }
                  if (this.index == 2) {
                    // Get.changeTheme(darkTheme());
                  this.index =3;
                  }
                }),
          ),
        ),
      ]),
    );
  }
}
