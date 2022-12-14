import 'package:coach_nearest/models/Firebase_Models/data_model.dart';
import 'package:coach_nearest/modules/update_screen/update_data_model.dart';
import 'package:coach_nearest/shared/networks/local/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../shared/styles/colors.dart';

class task_Item extends StatefulWidget {
  Data_Model data_model;

  task_Item(this.data_model);

  static const String routeName = "task_Item";

  @override
  State<task_Item> createState() => _task_ItemState();
}

class _task_ItemState extends State<task_Item> {


  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var tasktitle = "";

  var clicked = false;

  @override
  void initState(){
    super.initState();
     titleController = TextEditingController();
  }

  @override
  void dispose(){
    titleController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteTaskFromFirebaseFirestore(widget.data_model.id);
            },
            backgroundColor: Colors.red,
            label: "Delete".tr,
            autoClose: true,
            icon: Icons.delete,
          ),
          SlidableAction(
              onPressed: (context) async {
                // update Function from FireStore
                final tasktitle = await OpenUpdateDialog();
                if(tasktitle == null || tasktitle.isEmpty) return;

                setState(() => this.tasktitle = tasktitle);
              },
              backgroundColor: Colors.greenAccent,
              label: "Update".tr,
              autoClose: true,
              icon: Icons.update)
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.brown,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 4,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
            "${widget.data_model.title}".tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  Text(
                    "${widget.data_model.description}".tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.brown),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.brown,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      if (clicked == false) {
                        clicked = true;
                      } else if (clicked == true) {
                        clicked = true;
                      }
                      setState(() {});
                    },
                    child: clicked
                        ? Text(
                            "Done!".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        : Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 25,
                          )))
          ],
        ),
      ),
    );
  }

  Future<String?> OpenUpdateDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(child: Text("Update Task".tr)),
            content: Form(
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: titleController,
                    validator: (text) {
                      if (text == "") {
                        return " Please write title task".tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("New Title".tr),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                            ),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    autofocus: true,
                    maxLines: 2,
                    controller: descriptionController,
                    validator: (text) {
                      if (text == "") {
                        return " Please write description task".tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("New Description".tr),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                            ),
                            borderRadius: BorderRadius.circular(30))),
                  ),

                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: cancel, child: Text("Cancel".tr,style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)),
                  TextButton(
                      onPressed: (){
                        updateTaskFromFirebaseFirestore(widget.data_model.id,titleController.text,descriptionController.text);
                        Navigator.of(context).pop();
                      },
                      child: Text("Update".tr,style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),))
                ],
              ),

            ],
          ));

  void cancel() {
    Navigator.of(context).pop();
  }

  // String update() {
  //  return titleController.text != null ?
  //  tasktitle =  :
  //  tasktitle = "${titleController.text}";
  //
  // }
}
