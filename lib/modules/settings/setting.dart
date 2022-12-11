import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting_Tab extends StatelessWidget {

 Setting_Tab({Key? key}) : super(key: key);

  static const String routeName = "Setting";

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
                         child: Center(child: ElevatedButton.icon(
                           onPressed: (){},
                           label: const Text('Light',style: TextStyle(color: PRIMARY_COLOR),),
                           style:ElevatedButton. styleFrom(
                             side: BorderSide(
                                 color: PRIMARY_COLOR
                             ),
                             minimumSize: Size(200, 50),
                             backgroundColor: Colors.white,
                           ), icon: Icon(
                           Icons.light_mode,
                           color: Colors.yellow,
                           size: 24.0,
                         ),


                         ),),
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
