import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions.dart';
import "../data/quiz1.dart";

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  List<dynamic> userAnswers = List.filled(q.length, null);
  bool isQuizCompleted = false;

  final TextEditingController textController = TextEditingController();

  void _nextQuestion() {
    final question = q[currentIndex];

    if (userAnswers[currentIndex] == question.correctAnswerIndex) score++;

    if (currentIndex < q.length - 1) {
      setState(() {
        currentIndex++;
        textController.clear();
      });
    } else {
      setState(() {
        isQuizCompleted = true;
        Navigator.pushReplacementNamed(context, '/result', arguments: score);
      });
    }
  }

  Widget _buildOptions(Question q) {
    if (q.options != null) {
      return Column(
        children: List.generate(q.options!.length, (i) {
          return ListTile(
            title: Text(q.options![i]),
            leading: Radio(
              value: i,
              groupValue: userAnswers[currentIndex],
              onChanged: (val) {
                setState(() {
                  userAnswers[currentIndex] = val;
                });
              },
            ),
          );
        }),
      );
    } else {
      return TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: 'Your Answer',
          border: OutlineInputBorder(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Question = q[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Question ${currentIndex + 1}/${q.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Question.questionImage != null)
              Center(child: Image.asset(Question.questionImage!, height: 200)),
            SizedBox(height: 20),
            Text(
              Question.questionText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildOptions(q[currentIndex]),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  if (Question.correctAnswerText != null &&
                      textController.text.trim().isEmpty)
                    return;
                  if ((Question.options != null ||
                          Question.optionsImage != null) &&
                      userAnswers[currentIndex] == null)
                    return;

                  _nextQuestion();
                },
                child: Text(currentIndex < (q.length - 1) ? "next" : "Finish"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
