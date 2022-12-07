
import 'package:coach_nearest/models/list_settings_provider.dart';
import 'package:coach_nearest/modules/settings/setting.dart';
import 'package:coach_nearest/modules/task_list/taskList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  int CurrentIndex = 0;

  List<Widget> ToDoTabs = [
    Task_List_Tab(),
    Setting_Tab()
  ];
  @override
  Widget build(BuildContext context) {


    var provider = Provider.of<list_settings_provider>(context);


    return SafeArea(
      child: Stack(
        children:[
          Scaffold(
          body: ToDoTabs[CurrentIndex],
          appBar: AppBar(
            title: Text("ToDo List"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: CurrentIndex,
            onTap: (currentIndex){
               CurrentIndex =  currentIndex;
              provider.ListOrSettings(currentIndex,context);
            },
            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icons/icon_list.png"),size: 20,),label: ""),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icons/icon_settings.png"),size: 20,),label: "")
            ],
          ),
        ),
        ]
      ),
    );
  }
}
