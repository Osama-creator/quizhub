import 'package:equatable/equatable.dart';

class McqQuestion extends Equatable {
  final String teacherId;
  final String examId;
  final String question;
  final String? image;
  final String rightAnswer;
  final String? wrongAns1;
  final String? wrongAns2;
  final String? wrongAns3;
  final String? note;
  String? userChoice;

  McqQuestion({
    required this.teacherId,
    required this.examId,
    required this.question,
    this.image,
    required this.rightAnswer,
    this.userChoice,
    this.wrongAns1,
    this.wrongAns2,
    this.wrongAns3,
    this.note,
  });

  factory McqQuestion.fromJson(Map<String, dynamic> json) {
    return McqQuestion(
      teacherId: json['createdby'] as String,
      examId: json['Idexam'] as String,
      question: json['question'] as String,
      image: json['img'] as String,
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
      'img': image,
      'correct_Answer': rightAnswer,
      'choose2': wrongAns1,
      'choose3': wrongAns2,
      'choose4': wrongAns3,
      'test_node': note,
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
