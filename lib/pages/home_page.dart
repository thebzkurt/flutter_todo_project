import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_project/data/detabase.dart';
import 'package:todo_project/util/dialog_box.dart';
import 'package:todo_project/util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refrence the this box
  final _myBox = Hive.box('myBox');
  ToDoDataBase  db = ToDoDataBase();

  @override
  void initState() {

    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }


  // text controller
  final _controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
     db.updateData();

  }

  // create new task
  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DiaglogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop()
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
     db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,       
        onPressed: creatNewTask,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
