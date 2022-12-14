import 'package:coach_nearest/models/Providers/select_date_provider.dart';
import 'package:coach_nearest/shared/networks/local/firebase_utils.dart';
import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/Firebase_Models/data_model.dart';
import '../../shared/components/components.dart';

class add_new_task extends StatefulWidget {
  static const String routeName = "add_new_task";

  @override
  State<add_new_task> createState() => _add_new_taskState();
}

class _add_new_taskState extends State<add_new_task> {
  TextEditingController task_controller = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  //
  FocusNode titleInput = FocusNode();
  FocusNode descriptionInput = FocusNode();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    descriptionInput.dispose();
    titleInput.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Write Your New Task".tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Form(
              key: FormKey,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // autofocus: true,
                        focusNode: titleInput,
                        controller: titleController,
                        validator: (text) {
                          if (text == "") {
                            return "Please write title task".tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: Text("title".tr),
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
                    ),
                    Expanded(
                      child: TextFormField(
                        // autofocus: true,
                        maxLines: 2,
                        focusNode: descriptionInput,
                        controller: descriptionController,
                        validator: (text) {
                          if (text == "") {
                            return " Please write description task".tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: Text("description".tr),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Select Date".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.date_range),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        DateDialog(context);
                      },
                      child: Column(
                        children: <Widget>[
                          Consumer<select_date>(builder: (context,SDate,child){
                            return Text(
                              "${SDate.year.tr} / ${SDate.month.tr} / ${SDate.day.tr}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue),
                            );
                          }),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (FormKey.currentState!.validate()) {
                                Data_Model DM =
                                Data_Model(title: titleController.text,
                                    description: descriptionController.text,
                                    date:DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                                ShowMessage(context,"Are you sure to add this task?".tr,"Yes".tr,(){
                                  addTaskToFirebaseFirestore(DM);
                                  hideLoding(context);
                                  Navigator.pop(context);
                                });

                              }
                            },
                            child: Text("Add Task".tr)),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel".tr))
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void DateDialog(BuildContext context) async {
    var  dateProvider = Provider.of<select_date>(context,listen: false);
    DateTime? selecDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if(selecDate==null)return;
    // selectedDate=selecDate;
    // setState(() {
    //
    // });
    selectedDate=selecDate;
    dateProvider.changeDate(selectedDate);

  }
}
