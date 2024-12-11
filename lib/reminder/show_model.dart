import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pill_mate/reminder/constants.dart';
import 'package:pill_mate/reminder/model/model.dart';
import 'package:pill_mate/reminder/provider/date_time.dart';
import 'package:pill_mate/reminder/provider/radio.dart';
import 'package:pill_mate/reminder/provider/service.dart';
import 'package:pill_mate/reminder/widget/datetime.dart';
import 'package:pill_mate/reminder/widget/radio.dart';
import 'package:pill_mate/reminder/widget/text_field.dart';

class AddNewTaskModel extends StatefulWidget {
  const AddNewTaskModel({super.key});

  @override
  _AddNewTaskModelState createState() => _AddNewTaskModelState();
}

class _AddNewTaskModelState extends State<AddNewTaskModel> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dateProv = ref.watch(dateProvider);
        return Container(
          padding: EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "New Task Reminder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  color: Colors.grey.shade200,
                ),
                Gap(12),
                Text(
                  "Add Drug",
                  style: AppStyle.headingOne,
                ),
                Gap(6),
                TextFieldWidget(
                  maxLine: 1,
                  hintText: "Add Drug Name",
                  txtController: titleController,
                ),
                Gap(12),
                Text(
                  "Description",
                  style: AppStyle.headingOne,
                ),
                Gap(6),
                TextFieldWidget(
                  maxLine: 5,
                  hintText: "Add Descriptions",
                  txtController: descriptionController,
                ),
                Gap(12),
                Text(

                  "Category",
                  style: AppStyle.headingOne,

                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioWidget(
                        categoryColor: Colors.greenAccent,
                        titleRadio: "MRN",
                        valueInput: 1,
                        onChangeValue: () => ref
                            .read(radioProvider.notifier)
                            .update((state) => 1),
                      ),
                    ),
                    Expanded(
                      child: RadioWidget(
                        categoryColor: Colors.blue.shade700,
                        titleRadio: "NN",
                        valueInput: 2,
                        onChangeValue: () => ref
                            .read(radioProvider.notifier)
                            .update((state) => 2),
                      ),
                    ),
                    Expanded(
                      child: RadioWidget(
                        categoryColor: Colors.amberAccent.shade700,
                        titleRadio: "EVN",
                        valueInput: 3,
                        onChangeValue: () => ref
                            .read(radioProvider.notifier)
                            .update((state) => 3),
                      ),
                    ),
                  ],
                ),
                // Date and Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateTimeWidget(
                      titleText: "Date",
                      valueText: dateProv.toString(),
                      iconSection: CupertinoIcons.calendar,
                      onTop: () async {
                        final getValue = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2026),
                        );
                        if (getValue != null) {
                          final format = DateFormat.yMd();
                          ref
                              .read(dateProvider.notifier)
                              .update((state) => format.format(getValue));
                        }
                      },
                    ),
                    Gap(22),
                    DateTimeWidget(
                      titleText: "Time",
                      valueText: ref.watch(timeProvider),
                      iconSection: CupertinoIcons.clock,
                      onTop: () async {
                        final getTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (getTime != null) {
                          ref
                              .read(timeProvider.notifier)
                              .update((state) => getTime.format(context));
                        }
                      },
                    ),
                  ],
                ),
                // Button
                Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue.shade800,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide(
                            color: Colors.blue.shade800,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                    ),
                    Gap(20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide(
                            color: Colors.blue.shade800,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          final getRadiovalue = ref.read(radioProvider);
                          String category = '';
                          switch (getRadiovalue) {
                            case 1:
                              category = 'Morning';
                              break;
                            case 2:
                              category = 'Noon';
                              break;
                            case 3:
                              category = 'Evening';
                              break;
                          }
                          ref.read(serviceProvider).addNewTask(TodoModel(
                            titleTask: titleController.text,
                            description: descriptionController.text,
                            category: category,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                            isDone: false,
                          ));

                          print("Data is saving");

                          titleController.clear();
                          descriptionController.clear();
                          ref
                              .read(radioProvider.notifier)
                              .update((state) => 0);
                          Navigator.pop(context);
                        },
                        child: Text("Create"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}