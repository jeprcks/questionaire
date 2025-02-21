import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_screen.dart';

class ScoreScreen extends StatelessWidget {
  final List<Question> questions;

  const ScoreScreen({super.key, required this.questions});

  int get score => questions.where((q) => q.isCorrect()).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2196F3), Color(0xFF1565C0)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$score/${questions.length}',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Your Score',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  getScoreMessage(score, questions.length),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white70,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue[900],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getScoreMessage(int score, int total) {
    final percentage = (score / total) * 100;
    if (percentage >= 80) {
      return 'Excellent!';
    } else if (percentage >= 60) {
      return 'Good Job!';
    } else if (percentage >= 40) {
      return 'Keep Practicing!';
    } else {
      return 'Try Again!';
    }
  }
}
