import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_application/Database/to_do_database.dart';
import 'package:todo_application/util/dialog_box.dart';
import 'package:todo_application/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() { 
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //reference of box database
  final _box = Hive.box('dataBox');

  //reference of database class
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //when user opens the app for first time
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //saving the task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //delete the task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateData();
    });
  }

  //create task
  void createTask() {
    showDialog(
        context: context,
        builder: 
        (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.of(context).pop();
              _controller.clear();
            },
          );
        });
  }

  //when checkbox is tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunciton: (context) => deleteTask(index),
            );
          }),
    );
  }
}
