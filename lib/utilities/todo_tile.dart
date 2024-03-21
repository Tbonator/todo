// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

//Constructor 
  ToDoTile({
    super.key, 
    required this.taskName,
     required this.taskCompleted,
      this.onChanged
      
      });

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
                //checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),
            //task name 
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted
                ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
        

          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}