import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final int index;
  final String answerText;

  Answer(this.selectHandler, this.answerText, this.index);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => selectHandler(index),
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ));
  }
}
