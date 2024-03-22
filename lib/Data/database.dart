import 'package:hive/hive.dart';

class TodoDatabase{

List toDoList = [];

  //reference our box 
  final _myBox = Hive.box('mybox');

//run thid method if this the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["First task", false],
      [ "Second task", false]
    ];
  }

  //load the database from database 
      void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

//update database 

void updateDatabse() {

  _myBox.put("TODOLOST", toDoList);

}
}