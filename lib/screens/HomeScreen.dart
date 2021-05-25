import 'package:firebase_getx/controllers/TodoControllers.dart';
import 'package:firebase_getx/screens/TodoScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoControllers todoControllers = Get.put(TodoControllers());

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX todo list"),
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      todoControllers.todos[index].text,
                      style: (todoControllers.todos[index].done)
                          ? TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            )
                          : TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color),
                    ),
                    onTap: () {},
                    trailing: Checkbox(
                      value: todoControllers.todos[index].done,
                      onChanged: (v) {
                        var changed = todoControllers.todos[index];
                        changed.done = v!;
                        todoControllers.todos[index] = changed;
                      },
                    ),
                  ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoControllers.todos.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
    );
  }
}
