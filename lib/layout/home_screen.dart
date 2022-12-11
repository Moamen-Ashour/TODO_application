
import 'package:coach_nearest/models/list_settings_provider.dart';
import 'package:coach_nearest/modules/New_Task/add_new_task.dart';
import 'package:coach_nearest/modules/settings/setting.dart';
import 'package:coach_nearest/modules/task_list/taskList.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final navigationKey  = GlobalKey<CurvedNavigationBarState>();

  int index = 2;

  int CurrentIndex = 0;

  List<Widget> ToDoScreens = [
    Task_List_Tab(),
    add_new_task(),
    Setting_Tab(),
    Setting_Tab()
  ];



  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<list_settings_provider>(context);



    final items = <Widget> [
      Icon(Icons.list,size: 30,),
      Icon(Icons.add,size: 30),
      Icon(Icons.dark_mode_outlined,size: 30),
      Icon(Icons.settings,size: 30),
    ];


    return SafeArea(
      child: Stack(
        children:[
          Scaffold(
          body: ToDoScreens[index],
          appBar: AppBar(
            title: Text("ToDo List".tr),
          ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white)
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: Colors.blueAccent,
                color: Colors.blueAccent,
                animationDuration: Duration(milliseconds: 600),
                animationCurve: Curves.easeInOut,
                items: items,
              height: 60,
                index: index,
                onTap: (index){
                  setState(() {
                    this.index = index;
                  });
                  if(this.index == 1){
                    showModalBottomSheet(context: context, builder: (context) => Center(
                      child: ElevatedButton(
                        child: Text("Close".tr),
                        onPressed: ()=> Navigator.pop(context),
                      ),
                    )
                    );
                  }
                },
              ),
            ),
        ),
        ]
      ),
    );
  }
}
