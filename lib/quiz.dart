import 'dart:io';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './windowbuttons.dart';
import './null.dart';

class Quiz extends StatelessWidget {
  final List<Map> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Platform.isWindows ? WindowButtons():nullWidget(),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 85.0,
          child: Question(
              questions[questionIndex]["questions"],
              const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: ListView.builder(
                itemCount: questions[questionIndex]["answers"].length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50.0,
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Answer(
                        answerQuestion,
                        questions[questionIndex]["answers"][index]["text"]
                            .toString(),
                        index),
                  );
                }),
          ),
        )
      ],
    );
  }
}
