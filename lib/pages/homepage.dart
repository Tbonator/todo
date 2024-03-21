// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo/utilities/dialog_box.dart';
import 'package:todo/utilities/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final _controller = TextEditingController();


   //create a list of todo tiles<ToDoTile>
    List toDoList = [
       ["Make a Tutorial",false],
       ["Do Exercise",false],
       ["ghghghghghg",false],
];

//save new Task
void saveTask(){
  setState(() {
    toDoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

//checked box tapped

void checkBoxChanged(bool? value,int index) {
  setState(() {
    toDoList[index][1] = !toDoList[index][1];
  });
}
//createa new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'TO DO',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      
      ),
      body: ListView.builder (
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
             taskName: toDoList[index][0],
             taskCompleted: toDoList[index][1],
             onChanged: (value) => checkBoxChanged(value,index),
          );
         

        },
      
      )
    );
  }
}