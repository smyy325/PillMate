import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pill_mate/reminder/provider/service.dart';
import 'package:pill_mate/reminder/show_model.dart';
import 'package:pill_mate/reminder/widget/card.dart';

class TodoPage extends ConsumerWidget {
  TodoPage({super.key});

  final String formattedDate = DateFormat('EEEE, dd MMMM').format(DateTime.now());
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todoData = ref.watch(fetchStreamProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[400],
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            "PillMate",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.calendar_today),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bell_fill),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Medicines",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, //Color(0xFFD5EBFA),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      context: context,
                      builder: (context) => const AddNewTaskModel(),
                    ),
                    child: const Text("+ New Drug", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Gap(20),
              ListView.builder(
                itemCount: todoData.value?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CardTodoListWidget(getIndex: index),
              )
            ],
          ),
        ),
      ),
    );
  }
}