import 'package:coach_nearest/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class add_new_task extends StatefulWidget {
  static const String routeName = "add_new_task";

  @override
  State<add_new_task> createState() => _add_new_taskState();
}

class _add_new_taskState extends State<add_new_task> {
  TextEditingController task_controller = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController DescriptionController = TextEditingController();

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
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Write Your New Task",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Form(
              key: FormKey,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        focusNode: titleInput,
                        controller: titleController,
                        validator: (text) {
                          if (text == "") {
                            return " Please write title task";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: Text("title"),
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
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        focusNode: descriptionInput,
                        controller: DescriptionController,
                        validator: (text) {
                          if (text == "") {
                            return " Please write description task";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: Text("description"),
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
                      child: Text(
                        "${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (FormKey.currentState!.validate()) {
                            print("Saved to DB");
                          }
                        },
                        child: Text("Add Task"))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void DateDialog(BuildContext context) async {
    DateTime? selecDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if(selecDate==null)return;
    selectedDate=selecDate;
    setState(() {

    });
  }
}
