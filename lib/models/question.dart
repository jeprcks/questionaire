class Question {
  final String category;
  final String question;
  final List<String> options;
  final String correctAnswer;
  String? userAnswer;

  Question({
    required this.category,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.userAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      category: json['category'],
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
    );
  }

  bool isCorrect() => userAnswer == correctAnswer;
}
