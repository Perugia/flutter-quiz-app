import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';
import 'package:flutter_quiz_app/answer.dart';
import 'package:flutter_quiz_app/windowbuttons.dart';

class Quiz extends StatelessWidget {
  final List<Map> questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (!kIsWeb && Platform.isWindows)
            ? WindowButtons()
            : const SizedBox(
                height: 50,
              ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 85.0,
          margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Question(
              questions[questionIndex]["questions"],
              const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
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
