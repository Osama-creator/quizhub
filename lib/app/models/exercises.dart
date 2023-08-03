import 'package:quizhub/app/models/questions.dart';

class Exam {
  final String id;

  final int? time;
  final String examName;

  final List<McqQuestion> questions;

  Exam({
    required this.id,
    this.time,
    required this.examName,
    required this.questions,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    List<McqQuestion> questions = [];
    if (json['question'] != null && json['question'] is List) {
      for (final questionData in json['question']) {
        questions
            .add(McqQuestion.fromJson(questionData as Map<String, dynamic>));
      }
    }
    return Exam(
      id: json['_id'] as String,
      time: json['time'] as int,
      examName: json['exam_Name'] as String,
      questions: questions,
    );
  }
}
