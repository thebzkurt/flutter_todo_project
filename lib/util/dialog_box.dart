import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_project/util/my_button.dart';


class DiaglogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DiaglogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(
                        color: Colors.grey.shade200, 
                        width: 2.0
                        ),
                    borderRadius: 
                    BorderRadius.circular(25.0),
                  ),
                  enabledBorder: 
                   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color:
                        Colors.white, 
                        width: 0.0
                        ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(
                      color: Colors.red
                      )),
                  hintText: "Add a new task 2"),
            ),

            //button save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),

                //const SizedBox(width: 20),
                // cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
