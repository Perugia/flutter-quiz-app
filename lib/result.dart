import 'package:flutter/material.dart';
import 'dart:io';
import './windowbuttons.dart';
import './null.dart';

class Result extends StatelessWidget {
  num TotalScore;
  final Function resetHandler;

  Result(this.TotalScore, this.resetHandler);

  String get result {
    String resultText = "Your Score: ${TotalScore.toString()}";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Platform.isWindows ? WindowButtons() : nullWidget(),
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
                child: const Text("Try again"),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        )),
      ],
    );
  }
}
