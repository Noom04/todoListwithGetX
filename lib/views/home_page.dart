import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todolist_getx/controllers/todo_controller.dart';
import 'package:todolist_getx/models/my_button.dart';
import 'package:todolist_getx/models/todo.dart';
import 'package:todolist_getx/models/todo_tile.dart';
import 'package:todolist_getx/views/pop_up_dialog.dart';
import '';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Todo List App '),
      ),
      body: Container(
        child: Obx(() => ListView.builder(
            itemCount: controller.todo.length,
            itemBuilder: (context, index) {
              return TodoTile(
                todoName: controller.todo[index].title,
                done: controller.todo[index].checkBox,
                onChange: (swap) {
                  var check = controller.todo[index];
                  check.checkBox = swap;
                  controller.todo[index] = check;
                },
                onPressed: (context) {
                  controller.todo.removeAt(index);
                },
                onTap: () {
                  Get.dialog(PopUpDialog(
                    index: index,
                  ));
                },
              );
            })),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: newTodoPop),
    );
  }

  newTodoPop() {
    Get.dialog(
      PopUpDialog(),
    );
  }
}
