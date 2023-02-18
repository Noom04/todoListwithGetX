import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todolist_getx/controllers/todo_controller.dart';

import '../models/my_button.dart';
import '../models/todo.dart';

class PopUpDialog extends StatelessWidget {
  int? index;
  PopUpDialog({this.index});

  final TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    String text = "";
    if (this.index != null) {
      text = controller.todo[index!].title;
    }
    TextEditingController textController = TextEditingController(text: text);
    return AlertDialog(
      backgroundColor: Colors.cyan,
      content: Container(
        // ignore: sort_child_properties_last
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  border: OutlineInputBorder(),
                  hintText: '  Add your plan'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    buttonName: this.index == null ? "Add" : "Edit",
                    onPressed: () {
                      if (this.index == null) {
                        controller.todo.add(Todo(title: textController.text));
                      } else {
                        var edit = controller.todo[index!];
                        edit.title = textController.text;
                        controller.todo[index!] = edit;
                      }

                      Get.back(closeOverlays: true);
                    }),
                MyButton(
                    buttonName: 'Cancel',
                    onPressed: () {
                      Get.back(closeOverlays: true);
                    })
              ],
            )
          ],
        ),
        height: 120,
      ),
    );
  }
}
