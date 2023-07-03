import 'package:quizhub/app/models/exersice.dart';

class Teacher {
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
      subj: json['material'] as String,
      profilePic: json['profile_pic'] as String? ?? '',
    );
  }
}

class TeacherModel {
  final String id;
  final String name;
  final String school;
  final String governorate;
  final String phone;
  final String area;
  final String email;
  final String password;
  final String material;
  final String role;
  final bool isLoggedIn;
  final List<String> follow;
  final List<String> followStudent;

  final List<ExerciseModel> exams;

  TeacherModel({
    required this.id,
    required this.name,
    required this.school,
    required this.governorate,
    required this.phone,
    required this.area,
    required this.email,
    required this.password,
    required this.material,
    required this.role,
    required this.isLoggedIn,
    required this.follow,
    required this.followStudent,
    required this.exams,
  });

  factory TeacherModel.fromMap(Map<String, dynamic> map,
      {required List<ExerciseModel> exams}) {
    return TeacherModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      school: map['school'] as String,
      governorate: map['governorate'] as String,
      phone: map['phone'] as String,
      area: map['Area'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      material: map['material'] as String,
      role: map['role'] as String,
      isLoggedIn: map['isLoggedIn'] as bool,
      follow: (map['follow'] as List<dynamic>).map((e) => e as String).toList(),
      followStudent: (map['followStudent'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      exams: exams,
    );
  }
}
