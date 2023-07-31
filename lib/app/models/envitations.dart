import 'package:quizhub/app/models/user.dart';

class Invitation {
  final String id;
  final List<dynamic> userId;
  final List<User> toUserId;
  final List<Exam> exams;
  final String createdAt;
  final String updatedAt;

  Invitation({
    required this.id,
    required this.userId,
    required this.toUserId,
    required this.exams,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) {
    List<Exam> exams = [];
    return Invitation(
      id: json['_id'] as String,
      userId: (json['idUser'] as List)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList(),
      toUserId: (json['toUserId'] as List)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList(),
      exams: exams,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}

class Exam {
  final String id;
  final String subjectName;
  final int time;
  final String examName;
  final String kindOfQuestions;
  final List<User> createdBy;
  final List<String> question;
  final List<String> grades;
  final List<String> createdUser;
  final String createdAt;
  final String updatedAt;

  Exam({
    required this.id,
    required this.subjectName,
    required this.time,
    required this.examName,
    required this.kindOfQuestions,
    required this.createdBy,
    required this.question,
    required this.grades,
    required this.createdUser,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['_id'] as String,
      subjectName: json['subject_Name'] as String,
      time: json['time'] as int,
      examName: json['exam_Name'] as String,
      kindOfQuestions: json['kindOf_questions'] as String,
      createdBy: (json['createdby'] as List)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList(),
      question: List<String>.from(json['question'] as List<dynamic>),
      grades: List<String>.from(json['Grades'] as List<dynamic>),
      createdUser: List<String>.from(json['creatdUser'] as List<dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
