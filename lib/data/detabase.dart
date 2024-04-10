import 'package:hive/hive.dart';

class ToDoDataBase{

   List toDoList = [];

  // reference our box
   final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");

  }


  void updateData() {
    _myBox.put("TODOLIST", toDoList);

  }

}