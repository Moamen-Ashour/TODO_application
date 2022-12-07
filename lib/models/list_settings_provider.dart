

import 'package:coach_nearest/modules/settings/setting.dart';
import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class list_settings_provider extends ChangeNotifier{

  int index = 0;

  void ListOrSettings(int indexNumber,BuildContext context){

    TextEditingController task_controller = TextEditingController();

    index = indexNumber;

    TimeOfDay time = TimeOfDay(hour: 00, minute: 00);

    if(index == 0){
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)
            )
          ),
          context: context, builder: (context)=>  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Add new Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: COLOR_BLACK,),),
              Container(
                width: 250,
                child: Row(                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: task_controller,
                        decoration: const InputDecoration(

                          hintText: 'enter your task',
                          hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: DARK_COLOR_GREY,),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 5),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              InkWell(
                onTap:() async{
                  TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time);
                  if(newTime == null) return;
                  time = newTime;
                },
                child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: COLOR_BLACK),),
                   SizedBox(width: 15,),
                    Text("${time.hour}:${time.minute}",
                    textAlign: TextAlign.center  ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: DARK_COLOR_GREY),),
                  ],
                ))

            ],
          )
      );
    }
    else{
     Setting_Tab();
    }
    notifyListeners();
  }

}