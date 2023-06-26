import 'package:quizhub/app/models/user.dart';

class StudentDegree {
  final User user;
  final List<DegreeExam> degreeExams;

  StudentDegree({
    required this.user,
    required this.degreeExams,
  });

  factory StudentDegree.fromJson(Map<String, dynamic> json) {
    final user = User.fromJson(json['user'] as Map<String, dynamic>);
    final degreeExamsData = json['degreeExam'] as List<dynamic>;
    final degreeExams = degreeExamsData
        .map((exam) => DegreeExam.fromJson(exam as Map<String, dynamic>))
        .toList();

    return StudentDegree(
      user: user,
      degreeExams: degreeExams,
    );
  }
}

class DegreeExam {
  final String id;
  final List<String> question;
  final int degree;

  DegreeExam({
    required this.id,
    required this.question,
    required this.degree,
  });

  factory DegreeExam.fromJson(Map<String, dynamic> json) {
    final questionData = json['question'] as List<dynamic>;
    final question = questionData.map((item) => item as String).toList();

    return DegreeExam(
      id: json['_id'] as String,
      question: question,
      degree: json['degree'] as int,
    );
  }
}
