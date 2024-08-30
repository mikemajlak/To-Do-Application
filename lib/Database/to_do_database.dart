import 'package:hive/hive.dart';

class ToDoDatabase {
  //list which contains the task
  List toDoList = [];

  //reference the box
  final _box = Hive.box('dataBox');

  //run this method when first time opening this app ever
  void createInitialData() {
    toDoList = [
      ['exercise for 30 minutes', false],
      ['work on project', false],
      ['wash clothes', false],
    ];
  }

  //load the data from the database (get the current to do list that was stored in the databse)
  void loadData() {
    toDoList = _box.get("TODOLIST");
  }

  //update the data in database (whenever the data changes such as checked or unchecked a task or delete a task) call this method
  void updateData() {
    _box.put("TODOLIST", toDoList);
  }
}
