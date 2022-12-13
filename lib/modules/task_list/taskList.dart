import 'package:coach_nearest/modules/task_list/task_item.dart';
import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/Providers/select_date_provider.dart';

class Task_List_Tab extends StatelessWidget {

  static const String routeName = "Task_list";

  // DateTime _selectedValue = DateTime.now();
  DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {

    var dateProvider = Provider.of<select_date>(context);

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
                DateTime.now().add(Duration(days: 3)),
                DateTime.now().add(Duration(days: 10)),
                DateTime.now().add(Duration(days: 17)),
              ],
              onDateChange: (date) {
                // New date selected
               dateProvider.changeDate(date);
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
