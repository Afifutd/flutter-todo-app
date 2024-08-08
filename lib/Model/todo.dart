class Todo {
  String? id;
  String? todoText;
  bool? isDone;

  Todo({this.id, this.todoText, this.isDone});

  static List todoList() {
    return [
      Todo(id: "01", isDone: true, todoText: "Morning Excercise"),
      Todo(id: "02", isDone: true, todoText: "Buy Groceries"),
      Todo(id: "03",isDone: false,  todoText: "Check Emails"),
      Todo(id: "04",isDone: false,  todoText: "Team Meeting"),
      Todo(id: "05",isDone: false,  todoText: "Work on mobile app for 2 hour"),
      Todo(id: "06",isDone: false,  todoText: "Have Dinner")
    ];
  }
}
