import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_nearest/models/Firebase_Models/data_model.dart';
import 'package:coach_nearest/modules/task_list/task_item.dart';
import 'package:coach_nearest/shared/networks/local/firebase_utils.dart';
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

  DateTime CurrentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var dateProvider = Provider.of<select_date>(context);

    return Container(
        padding: EdgeInsets.all(20.0),
        // color: Colors.white54,
        child: Column(

          children: <Widget>[

            DatePicker(
              DateTime.now(),
              width: 70,
              locale: 'langCalender'.tr,
              height: 120,
              controller: _controller,
              initialSelectedDate: CurrentDate,
              selectionColor: Colors.white,
              selectedTextColor: Colors.lightBlueAccent,
              deactivatedColor: Colors.red,
              monthTextStyle: TextStyle(color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              dayTextStyle: TextStyle(color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              dateTextStyle: TextStyle(color: Colors.brown,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              daysCount: 365,
              inactiveDates: [
                DateTime.now().add(Duration(days: 2)),
                DateTime.now().add(Duration(days: 9)),
                DateTime.now().add(Duration(days: 16)),
              ],
              onDateChange: (date) {
                // New date selected
                CurrentDate = date;
                dateProvider.changeDate(CurrentDate);
              },
            ),

            StreamBuilder<QuerySnapshot<Data_Model>>(
                stream: getTaskFromFirebaseFirestore(CurrentDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error Please Try Again Later".tr));
                  }


                  var dataModel = snapshot.data?.docs.map((e) => e.data()).toList()??[];

                  if (dataModel.isEmpty) {
                     return Padding(
                       padding: const EdgeInsets.only(top:58.0),
                       child: Text("No Data".tr,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
                     );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: dataModel.length,
                        itemBuilder: (context,index){
                          return task_Item(dataModel[index]);
                        }),
                  );
                }),

            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 15,
            //       itemBuilder: (c, index) {
            //         return task_Item();
            //       }),
            // )
          ],
        ));
  }
}
