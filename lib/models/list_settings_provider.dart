

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

    }
    else{
     Setting_Tab();
    }
    notifyListeners();
  }

}