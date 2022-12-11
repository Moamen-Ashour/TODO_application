import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/styles/ThemeOfData.dart';

class Setting_Tab extends StatefulWidget {

 Setting_Tab({Key? key}) : super(key: key);

  static const String routeName = "Setting";

  @override
  State<Setting_Tab> createState() => _Setting_TabState();
}

class _Setting_TabState extends State<Setting_Tab> {
  final locales2 = [
    Locale('en'),
    Locale('ar'),
  ];

  showLocaleDialog(BuildContext context) {
    final locales = [
      {'name': 'English'.tr},
      {'name': 'Arabic'.tr},
      {'name': 'Another'.tr},
    ];



    updateLocale(Locale locale, BuildContext context) {
      Navigator.of(context).pop();
      Get.updateLocale(locale);
    }

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Language".tr),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${locales[index]['name']}"),
                  ),
                  onTap: () =>  updateLocale(locales2[index],context),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: COLOR_BLACK,
                ),
                itemCount: 3),
          ),
        ));
  }

  bool itsDark = true;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        color: GREEN_BACKGROUND,
        child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Language".tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: COLOR_BLACK),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: ElevatedButton(onPressed: (){
                            showLocaleDialog(context);
                          },
                              child: Text( "Select language".tr,style: TextStyle(color: PRIMARY_COLOR),)
                              ,style:ElevatedButton. styleFrom(
                                side: BorderSide(
                                    color: PRIMARY_COLOR
                                ),
                                minimumSize: Size(200, 50),
                                backgroundColor: Colors.white,
                              )
                          ),),
                        ),
                      ],
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Mode".tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: COLOR_BLACK)),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Center(child:GestureDetector(
                             onDoubleTap: () {
                               setState(() {
                                 Get.changeTheme(lightTheme());
                                 itsDark = false;
                                 const snackBar = SnackBar(
                                   content: Text('One Click To Dark Mode!',style: TextStyle(color: Colors.black),),
                                 );
                                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               });
                               },
                             onTap: () {
                               setState(() {
                                 Get.changeTheme(darkTheme());
                                 itsDark = true;
                                 const snackBar = SnackBar(
                                   content: Text('Double Click To Light Mode!',style: TextStyle(color: Colors.amber),),
                                 );
                                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               });
                             },
                             child: itsDark == true
                                 ? Icon(Icons.dark_mode_outlined, size: 30,color: Colors.black,)
                                 : Icon(Icons.sunny, size: 30,color: Colors.amber,)),
                         ),
                       )
                     ],
                   ),
                 )
                ],
              ),
      )
      ),
    );
  }
}
