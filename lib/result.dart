import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_quiz_app/windowbuttons.dart';

class Result extends StatelessWidget {
  final num totalScore;
  final Function resetHandler;

  const Result(this.totalScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get result {
    String resultText = "Your Score: ${totalScore.toString()}";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (!kIsWeb && Platform.isWindows)
            ? WindowButtons()
            : const SizedBox(
                height: 50,
              ),
        Center(
            child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                result,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () => resetHandler(),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Try again"),
              )
            ],
          ),
        )),
      ],
    );
  }
}
