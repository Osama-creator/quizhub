// ignore_for_file: avoid_dynamic_calls

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class McqQuestion extends Equatable {
  final String teacherId;
  final String? id;
  final String examId;
  String question;
  String? image;
  String rightAnswer;
  String? wrongAns1;
  String? wrongAns2;
  String? wrongAns3;
  String? note;
  String? userChoice;
  bool? isSelectedFWord;
  bool? isSelectedSWord;
  bool? isCorrect;

  McqQuestion({
    required this.teacherId,
    required this.examId,
    required this.question,
    this.image,
    this.id,
    required this.rightAnswer,
    this.userChoice,
    this.wrongAns1,
    this.wrongAns2,
    this.wrongAns3,
    this.note,
    this.isSelectedFWord = false,
    this.isSelectedSWord = false,
    this.isCorrect = false,
  });

  factory McqQuestion.fromJson(Map<String, dynamic> json) {
    return McqQuestion(
      teacherId: json['createdby'][0] as String,
      id: json['_id'] as String,
      examId: json['exam'][0] as String,
      image: json['profile_pic'] as String? ?? "",
      question: json['question'] as String,
      rightAnswer: json['correct_Answer'] as String,
      wrongAns1: json['choose2'] as String?,
      wrongAns2: json['choose3'] as String?,
      wrongAns3: json['choose4'] as String?,
      note: json['test_node'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdby': teacherId,
      'Idexam': examId,
      'question': question,
      'correct_Answer': rightAnswer,
      'choose2': wrongAns1,
      'choose3': wrongAns2,
      'choose4': wrongAns3,
      if (image != null && image!.isNotEmpty) 'img': image,
      if (note != null && note!.isNotEmpty) 'test_node': note,
    };
  }

  @override
  List<Object?> get props => [
        teacherId,
        examId,
        question,
        image,
        rightAnswer,
        isCorrect,
        isSelectedFWord,
        isSelectedSWord
      ];
}
