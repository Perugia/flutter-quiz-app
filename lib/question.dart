import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  final TextStyle style;

  Question(this.questionText, this.style);

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: style,
      textAlign: TextAlign.center,
    );
  }
}
