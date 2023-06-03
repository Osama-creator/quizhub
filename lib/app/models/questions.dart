class McqQuestion {
  final String? id;
  final String question;
  final String image;
  final String rightAnswer;
  final List<String>? wrongAnswers;
  String? userChoice;

  McqQuestion({
    this.id,
    this.userChoice,
    required this.question,
    required this.image,
    required this.rightAnswer,
    required this.wrongAnswers,
  });
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

class Myq {
  List<McqQuestion> myquestions = [
    McqQuestion(
      question: "كم عدد قارات العالم",
      image: "",
      rightAnswer: "7 قارات",
      wrongAnswers: const [
        "7 قارات",
        "8 قارات",
        "4 قارات",
        "غير ذلك",
      ],
    ),
    McqQuestion(
      question: 'ما هو أطول نهر ف العالم',
      image: "",
      rightAnswer: "نهر النيل",
      wrongAnswers: const [
        "نهر النيل",
        "نهر الفرات",
        "نهر دجله",
        "غير ذلك",
      ],
    ),
    McqQuestion(
      question: "أين تقع البرازيل",
      image: "",
      rightAnswer: "أمريكا الجنوبيه",
      wrongAnswers: const [
        "أمريكا الجنوبيه",
        "أمريكا الشماليه",
        "أفريقيا",
        "أوروبا",
      ],
    ),
  ];
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
