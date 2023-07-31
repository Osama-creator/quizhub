import 'package:equatable/equatable.dart';
import 'package:quizhub/app/models/user.dart';

class StudentDegree extends Equatable {
  final User user;
  final int questionIds;
  final int degree;

  const StudentDegree({
    required this.user,
    required this.questionIds,
    required this.degree,
  });

  factory StudentDegree.fromJson(Map<String, dynamic> json) {
    final user = User.fromJson(json['user'] as Map<String, dynamic>);
    final List<dynamic> degreeExamsData = json['degreeExam'] as List<dynamic>;
    final degreeExams = degreeExamsData
        .map((exam) => DegreeExam.fromJson(exam as Map<String, dynamic>))
        .toList();

    return StudentDegree(
      user: user,
      questionIds: degreeExams[0].question.length,
      degree: degreeExams[0].degree,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user, questionIds, degree];
}

class DegreeExam extends Equatable {
  final int degree;
  final List<String> question;

  const DegreeExam({
    required this.degree,
    required this.question,
  });

  factory DegreeExam.fromJson(Map<String, dynamic> json) {
    final questionData = json['idexam']['question'] as List<dynamic>;
    final question = questionData.map((item) => item as String).toList();

    return DegreeExam(
      degree: json['degree'] as int,
      question: question,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [degree, question];
}
