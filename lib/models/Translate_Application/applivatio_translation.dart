

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
      "Select Date":"Select Date",
      "Another" : "Add Another Languages",
      "Close"  : "Close",
      'Double Click To Light Mode!' : 'Double Click To Light Mode!',
      'One Click To Dark Mode!' : 'One Click To Dark Mode!',
      "langCalender":"en",

    },


    'ar_EG': {
      "Language": "اللغة",
      "langCalender":"ar",
      "English" : "الانجليزية",
      "Arabic"  : "العربية",
      "Mode"    : "النسق",
      "Light"   : 'مضيء',
      'Dark'    : 'غامق',
      "Setting" : "الإعدادات",
      'Double Click To Light Mode!' : 'إضغظ مرتين للوضع الساطع',
      'One Click To Dark Mode!' : 'إضغظ مرة للوضع الداكن',
      "ToDo List": "قائمة المهام",
      "Add new Task":"إضافة مهمه جديدة",
      'enter your task':'اكتب مهمتك',
      "Select Date":"إختار التاريخ",
      "Another" : "اضف لغة جديدة",
      "Select language":"اختار لغتك",
      "Close" : "قفل"
    }


  };


}