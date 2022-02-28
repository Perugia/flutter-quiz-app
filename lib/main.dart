import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

final _questions = List<Map>.empty(growable: true);

void main() {
  _questions.addAll([
    {
      "questions": "What's your favorite Hero?",
      "answers": [
        {"text": "Spiderman", "score": 55},
        {"text": "Batman", "score": 0},
        {"text": "Joker", "score": 45},
        {"text": "Ironman", "score": 39}
      ]
    },
    {
      "questions": "What's your favorite Color?",
      "answers": [
        {"text": "Green", "score": 15},
        {"text": "Red", "score": 5},
        {"text": "Blue", "score": 8},
        {"text": "Black", "score": 25},
      ]
    },
    {
      "questions": "What's your favorite Animal?",
      "answers": [
        {"text": "Cat", "score": 15},
        {"text": "Dog", "score": 31},
        {"text": "Bird", "score": 13},
        {"text": "Snake", "score": 18},
      ]
    },
  ]);
  runApp(MyApp());

  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(400, 560);
    win.minSize = initialSize;
    win.size = initialSize;
    win.maxSize = initialSize;
    win.alignment = Alignment.center;
    win.title = "My First App";
    win.show();
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  num TotalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      TotalScore = 0;
    });
  }

  void _answerQuestion(int choice) {
    TotalScore += _questions[_questionIndex]["answers"][choice]["score"];
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: Container(
            child: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result(TotalScore, _resetQuiz)),
      ),
    );
  }
}
