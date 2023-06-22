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
  });

  factory McqQuestion.fromJson(Map<String, dynamic> json) {
    return McqQuestion(
      teacherId: json['createdby'][0] as String,
      id: json['_id'] as String,
      examId: json['exam'][0] as String,
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
  List<Object?> get props => [teacherId, examId, question, image, rightAnswer];
}

class TrueFalseQuestion {
  final String? id;
  final String question;
  bool isTrue;
  final String? image;
  bool? userChoice;

  TrueFalseQuestion({
    this.id,
    this.image,
    this.userChoice,
    required this.question,
    required this.isTrue,
  });
}

class FillTheGapsQuestion {
  final String? id;
  final String question;
  final String correctAnswer;
  String? userAnswer;

  FillTheGapsQuestion({
    this.id,
    required this.question,
    required this.correctAnswer,
    this.userAnswer,
  });
}

class MatchingQuestion {
  final String? id;
  final String fWord;
  final String sWord;
  bool isSelectedFWord = false;
  bool isSelectedSWord = false;
  bool isCorrect = false;

  MatchingQuestion({
    this.id,
    required this.fWord,
    required this.sWord,
  });
}

class Myq2 {
  List<TrueFalseQuestion> myquestions = [
    TrueFalseQuestion(
      question: "7 هل عدد قارات العالم",
      image: "",
      isTrue: true,
    ),
    TrueFalseQuestion(
      question: "هل مصر دوله أفريقيه",
      image: "",
      isTrue: true,
    ),
    TrueFalseQuestion(
      question: "هل مضاد كلمه الدنيا الاخره",
      image: "",
      isTrue: false,
    ),
  ];
}

class Myq3 {
  List<MatchingQuestion> myquestions = [
    MatchingQuestion(
      fWord: "بيت",
      sWord: "Home",
    ),
    MatchingQuestion(
      fWord: "سياره",
      sWord: "Car",
    ),
    MatchingQuestion(
      fWord: "معلم",
      sWord: "Teacher",
    ),
    MatchingQuestion(
      fWord: "طالب",
      sWord: "Student",
    ),
  ];
}
