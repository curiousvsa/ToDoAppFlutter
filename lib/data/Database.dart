

import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference the Box
  final _myBox = Hive.box('myBox');


  //create initial Data (FirstTime)
  void createInitialData() {
    toDoList = [
      ['Demo Text 1', false],
      ['Demo Text 2', false],
    ];
  }

  //load data from Db
  void loadDataFromDb() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update the DB
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
