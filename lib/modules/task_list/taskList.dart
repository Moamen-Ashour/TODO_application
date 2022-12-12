import 'package:coach_nearest/modules/task_list/task_item.dart';
import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Task_List_Tab extends StatefulWidget {
  const Task_List_Tab({Key? key}) : super(key: key);

  static const String routeName = "Task_list";

  @override
  State<Task_List_Tab> createState() => _Task_List_TabState();
}

class _Task_List_TabState extends State<Task_List_Tab> {
  DateTime _selectedValue = DateTime.now();

  DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        // color: Colors.white54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DatePicker(
              DateTime.now(),
              width: 70,
              locale: 'langCalender'.tr,
              height: 120,
              controller: _controller,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.white,
              selectedTextColor: Colors.lightBlueAccent,
                deactivatedColor: Colors.red,
                monthTextStyle: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 12),
                dayTextStyle: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 12),
                dateTextStyle: TextStyle(color: Colors.brown,fontSize: 16,fontWeight: FontWeight.bold),
                daysCount: 365,
              inactiveDates: [
                DateTime.now().add(Duration(days: 4)),
                DateTime.now().add(Duration(days: 11)),
                DateTime.now().add(Duration(days: 18)),
              ],
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (c,index){
                return task_Item();
              }),
            )
          ],
        ));
  }
}
