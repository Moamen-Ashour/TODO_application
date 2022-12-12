

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class task_added_screen extends StatelessWidget {

  const task_added_screen({Key? key}) : super(key: key);

  static const String routeName = "task_added_screen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(child: Column(
        children: [
          LottieBuilder.asset("assets/images/img/stillnotfinished/issue1.json"),
          SizedBox(height: 20,),
          Text("Working On It",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),)
        ],
      )),
    );
  }
}
