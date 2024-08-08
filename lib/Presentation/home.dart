import 'package:flutter/material.dart';
import '../Model/todo.dart';
import '../Widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  final todoController = TextEditingController();
  List foundToDo = [];

  @override
  void initState() {
    foundToDo = todosList;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff7f9fc),
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.menu,
                color: Color(0xff3A3A3A),
                size: 30,
              )
            ],
          ),
          backgroundColor: Color(0xfff7f9fc),
        ),
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin:
                            EdgeInsets.only(top: 50, bottom: 20, left: 5.0),
                            child: Text(
                              "All ToDOs",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ),
                          for (Todo todoo in foundToDo.reversed)
                            TodoItem(
                              todo: todoo,
                              onToDoChange: handleToDoChange,
                              onDeleteItem: deleteToDoItem,
                            ),
                        ],
                      ),
                    )
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0)
                          ]),
                      child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                              hintText: "Add a new ToDO Item",
                              border: InputBorder.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          minimumSize: Size(60, 60),
                          elevation: 10),
                      onPressed: () {
                        addToDoItem(todoController.text);
                      },
                      child: Text("+",
                        style: TextStyle(fontSize: 40, color: Colors.white),),),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.white),
            child: TextField(onChanged: runFilter,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                  prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
                  border: InputBorder.none,
                  hintText: "Search"),
            ),
          ),
        ],
      ),
    );
  }

  void handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !(todo.isDone)!;
    });
  }

  void deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addToDoItem(String toDo) {
    setState(() {
      todosList.add(Todo(id: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(), isDone:false, todoText: toDo));
    });
    todoController.clear();
  }

  void runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

}
