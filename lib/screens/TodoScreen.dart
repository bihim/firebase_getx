import 'package:firebase_getx/controllers/TodoControllers.dart';
import 'package:firebase_getx/models/Todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final TodoControllers todoControllers = Get.find<TodoControllers>();
  final int? index;
  TodoScreen({this.index});
  @override
  Widget build(BuildContext context) {
    String? text = this.index == null ? "" : todoControllers.todos[index!].text;
    TextEditingController textEditingController = TextEditingController(
      text: text,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Firebase"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "What is on your mind?",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 999,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = textEditingController.text.toString();
                      if (text.isNotEmpty) {
                        if (this.index == null) {
                          todoControllers.todos.add(
                            Todo(text: textEditingController.text, done: false),
                          );
                        } else {
                          var editing = todoControllers.todos[index!];
                          editing.text = textEditingController.text;
                          todoControllers.todos[index!] = editing;
                        }
                        Get.back();
                      }
                    },
                    child: Text(
                      (this.index == null ? "Add" : "Edit"),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
