class Question {
  final String questionText;
  final List<String>? options;
  final int? correctAnswerIndex;
  final String? correctAnswerText;
  final String? questionImage;
  final List<String>? optionsImage;

  Question({
    required this.questionText,
    this.options,
    this.correctAnswerIndex,
    this.correctAnswerText,
    this.questionImage,
    this.optionsImage,
  });
}
