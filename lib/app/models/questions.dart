// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class McqQuestion extends Equatable {
  final String teacherId;
  final String? id;
  String? examId;
  String question;
  String? words;
  File? image;
  String? pic;
  String rightAnswer;
  String? wrongAns1;
  String? wrongAns2;
  String? wrongAns3;
  String? note;
  String? userChoice;
  bool? isSelectedFWord;
  bool? isSelectedSWord;
  List<String> shuffledWords = [];
  bool? isCorrect;

  McqQuestion({
    required this.teacherId,
    this.examId,
    required this.question,
    this.image,
    this.pic,
    this.id,
    required this.rightAnswer,
    this.userChoice,
    this.wrongAns1,
    this.wrongAns2,
    this.wrongAns3,
    this.note,
    this.words,
    this.isSelectedFWord = false,
    this.isSelectedSWord = false,
    this.isCorrect = false,
  });

  factory McqQuestion.fromJson(Map<String, dynamic> json) {
    return McqQuestion(
      teacherId: json['createdby'][0] as String,
      id: json['_id'] as String,
      examId: json['exam'][0] as String,
      pic: json['profile_pic'] as String? ?? "",
      question: json['question'] as String,
      words: json['question'] as String,
      rightAnswer: json['correct_Answer'] as String,
      wrongAns1: json['choose2'] as String?,
      wrongAns2: json['choose3'] as String?,
      wrongAns3: json['choose4'] as String?,
      note: json['test_node'] as String?,
    );
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
