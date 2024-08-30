import 'package:flutter/material.dart';
import 'package:todo_application/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final dynamic controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({super.key, required this.controller,required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user input
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Add a new task"),
              ),

              //buttons to save and cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  MyButton(text: "save", onPressed: onSave),

                  const SizedBox(
                    width: 8,
                  ),

                  //cancel button
                  MyButton(text: "cancel", onPressed: onCancel)
                ],
              )
            ],
          )),
      backgroundColor: Colors.yellow,
    );
  }
}
