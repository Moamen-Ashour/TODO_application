

import 'package:coach_nearest/models/Firebase_Models/data_model.dart';
import 'package:coach_nearest/shared/networks/local/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class task_Item extends StatefulWidget {

  Data_Model data_model;
  task_Item(this.data_model);


  static const String routeName = "task_Item";

  @override
  State<task_Item> createState() => _task_ItemState();
}

class _task_ItemState extends State<task_Item> {
  var clicked = true;

  @override
  Widget build(BuildContext context) {


    return Slidable(

      startActionPane: ActionPane(motion: BehindMotion(),
      children: [
        SlidableAction(
            onPressed: (context){
              deleteTaskFromFirebaseFirestore(widget.data_model.id);
            },
        backgroundColor: Colors.red,
        label: "Delete",
        icon: Icons.delete,),
        SlidableAction(
            onPressed: (context){
              // update Function from FireStore
            },
        backgroundColor: Colors.greenAccent,
        label: "Update",
        icon: Icons.update)
      ],
      ),
      child: Container(
        decoration: BoxDecoration(
           color:  Colors.white,
            border: Border.all(
          color: Colors.brown,
          width: 3,
        ),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
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
                  Text("${widget.data_model.title}".tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                  Text("${widget.data_model.description}".tr,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.brown),)
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
              child: TextButton(
                onPressed: () {
                  clicked = !clicked;
                setState(() {

                });
                  },
                child: clicked ? Text("Done!", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),) : Icon( Icons.done,color:  Colors.white,size: 25,))
            )
          ],
        ),
      ),
    );
  }
}
