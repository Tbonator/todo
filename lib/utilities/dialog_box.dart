// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/utilities/my_button.dart';


class DialogBox extends StatelessWidget {

final controller;
VoidCallback onSave;
VoidCallback onCancel;



  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    
    });





  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
       
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input 
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),

            //buttons => save + delete
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button 
                MyButton(text: "Save", onPressed: onSave),
                 const SizedBox( width: 15),
                //delete button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )

          ],
        ),
      ) ,
      
    );
  }
}