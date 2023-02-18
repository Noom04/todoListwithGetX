import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  String todoName;
  bool done;
  Function(bool?)? onChange;
  Function(BuildContext)? onPressed;
  void Function()? onTap;
  TodoTile(
      {required this.todoName, required this.onChange, required this.done,required this.onPressed,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [SlidableAction(onPressed: onPressed,icon: Icons.delete,backgroundColor: Colors.red.shade300,)]),
        child: InkWell(onTap:onTap ,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.cyan, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Checkbox(
                    value: done,
                    onChanged: onChange,
                    activeColor: Colors.blueGrey,
                    checkColor: Colors.black,
                  ),
                  Text(
                    todoName,
                    style: TextStyle(
                        decoration: done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),Expanded(child: Text(textAlign:TextAlign.right,'⟵',style: TextStyle(fontSize: 25,color: Colors.red.shade700,fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
