import 'package:equatable/equatable.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/models/user.dart';

class SchoolDetailsModel extends Equatable {
  final List<User> students;
  final List<Teacher> teachers;

  const SchoolDetailsModel({required this.students, required this.teachers});

  factory SchoolDetailsModel.fromJson(Map<String, dynamic> json) {
    return SchoolDetailsModel(
      teachers: (json['teacher'] as List<dynamic>)
          .map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      students: (json['user'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [teachers, students];
}
