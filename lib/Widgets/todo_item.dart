import 'package:flutter/material.dart';

import '../Model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onToDoChange;
  final onDeleteItem;
  TodoItem({Key? key,required this.todo,this.onToDoChange,this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
            onTap: () {
              onToDoChange(todo);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: Colors.white,
            leading:todo.isDone! ? Icon(
              Icons.check_box,
              color: Colors.lightBlueAccent,
            ) :Icon(
              Icons.check_box_outline_blank,
              color: Colors.lightBlueAccent,
            ) ,
            title: Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: todo.isDone! ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5.0)),
              child: IconButton(
                icon: Icon(Icons.delete),
                iconSize: 18,
                color: Colors.white,
                onPressed: () {
                  onDeleteItem(todo.id);                },
              ),
            )));
  }
}
