

import 'package:flutter/material.dart';

class task_Item extends StatelessWidget {


  static const String routeName = "task_Item";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color:  Colors.white,
          border: Border.all(
        color: Colors.brown,
        width: 3,
      ),
        borderRadius: BorderRadius.circular(15)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 4,
            color: Colors.blue,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                Text("Description",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.brown),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color:Colors.blueAccent,
                border: Border.all(
                  color: Colors.brown,
                  width: 2,
                ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Icon( Icons.done,color:  Colors.white,size: 25,),
          )
        ],
      ),
    );
  }
}
