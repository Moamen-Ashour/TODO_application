import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Setting_Tab extends StatelessWidget {

  const Setting_Tab({Key? key}) : super(key: key);

  static const String routeName = "Setting";

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
                        Text("Language",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: COLOR_BLACK),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: ElevatedButton(onPressed: (){},
                              child: Text("English",style: TextStyle(color: PRIMARY_COLOR),)
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
                       Text("Mode",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: COLOR_BLACK)),
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
