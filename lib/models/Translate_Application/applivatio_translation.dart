

import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {

    'en_US': {
      "Language": "Language",
      "English" : "English",
      "Arabic"  : "Arabic",
      "Mode"    : "Mode",
      "Light"   : 'Light',
      'Dark'    : 'Dark',
      "Setting" : "Setting",
      "ToDo List": "ToDo List",
      "Add new Task":"Add new Task",
      'enter your task':'enter your task',
      "Select language":"Select language",
      "Select Time":"Select Time",
      "Another" : "Add Another Languages",
      "Close"  : "Close"
    },


    'ar_EG': {
      "Language": "اللغة",
      "English" : "الانجليزية",
      "Arabic"  : "العربية",
      "Mode"    : "النسق",
      "Light"   : 'مضيء',
      'Dark'    : 'غامق',
      "Setting" : "الإعدادات",
      "ToDo List": "قائمة المهام",
      "Add new Task":"إضافة مهمه جديدة",
      'enter your task':'اكتب مهمتك',
      "Select Time":"إختار الوقت",
      "Another" : "اضف لغة جديدة",
      "Select language":"اختار لغتك",
      "Close" : "قفل"
    }


  };


}