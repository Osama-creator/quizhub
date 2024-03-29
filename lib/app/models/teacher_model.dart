// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:quizhub/app/models/exersice.dart';

class Teacher extends Equatable {
  String id;
  String name;
  String subj;
  String profilePic;
  bool? invited;

  Teacher({
    required this.id,
    required this.name,
    required this.subj,
    this.profilePic = '',
    this.invited = false,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['_id'] as String,
      name: json['name'] as String,
      subj: json['material'] as String? ?? '',
      profilePic: json['profile_pic'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, subj, invited, profilePic];
}

class TeacherOreders extends Equatable {
  String id;
  String name;
  String subj;
  int confirm;

  TeacherOreders({
    required this.id,
    required this.name,
    required this.subj,
    required this.confirm,
  });

  factory TeacherOreders.fromJson(Map<String, dynamic> json) {
    return TeacherOreders(
      id: json['_id'] as String,
      name: json['name'] as String,
      subj: json['material'] as String,
      confirm: json['confirm'] as int,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        subj,
        confirm,
      ];
}

class TeacherModel {
  final String id;
  final String name;
  final String school;
  final String governorate;
  final String phone;
  final String area;
  final String email;
  final String image;
  final String material;
  final String role;
  final bool isLoggedIn;
  final List<String> follow;
  final List<String> followStudent;
  final List<ExerciseModel> exams;
  final List<DoneExerciseModel> doneExams;

  TeacherModel({
    required this.id,
    required this.name,
    required this.school,
    required this.governorate,
    required this.phone,
    required this.area,
    required this.email,
    this.image = "",
    required this.material,
    required this.role,
    required this.isLoggedIn,
    required this.follow,
    required this.followStudent,
    required this.exams,
    required this.doneExams,
  });

  factory TeacherModel.fromMap(
    Map<String, dynamic> map, {
    required List<ExerciseModel> exams,
    required List<DoneExerciseModel> doneExams,
  }) {
    return TeacherModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      school: map['school'] as String,
      governorate: map['governorate'] as String,
      phone: map['phone'] as String,
      area: map['Area'] as String,
      email: map['email'] as String,
      image: map['profile_pic'] as String? ?? '',
      material: map['material'] as String,
      role: map['role'] as String,
      isLoggedIn: map['isLoggedIn'] as bool,
      follow: (map['follow'] as List<dynamic>).map((e) => e as String).toList(),
      followStudent: (map['followStudent'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      exams: exams,
      doneExams: doneExams,
    );
  }
}
