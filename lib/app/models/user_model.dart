import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String name;
  final String school;
  final String governorate;
  final String area;
  final String email;
  final String? mobile;
  final String password;
  final String roleName;
  final String? className;
  final String? subject;
  final String? image;
  const UserModel({
    this.id,
    required this.name,
    required this.school,
    required this.governorate,
    required this.area,
    required this.email,
    this.mobile,
    required this.className,
    this.subject,
    required this.password,
    required this.roleName,
    this.image,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? roleName,
    String? image,
    String? className,
    String? school,
    String? area,
    String? subject,
    String? governorate,
    String? confirmPassword,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      roleName: roleName ?? this.roleName,
      image: image ?? this.image,
      school: image ?? this.school,
      area: image ?? this.area,
      subject: subject ?? this.subject,
      governorate: image ?? this.governorate,
      className: className ?? this.className,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'password': mobile,
      'img': image ?? "",
      'phoneNum': mobile ?? "",
      'roleName': roleName,
      'the_line': className ?? "",
      'school': school,
      'governorate': governorate,
      'Area': area,
      'material': subject ?? "",
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['phone'] as String? ?? "",
      password: map['password'] as String,
      image: map['profile_pic'] as String? ?? "",
      roleName: map['role'] as String,
      className: map['the_grades'] as String? ?? "",
      area: map['Area'] as String? ?? "",
      school: map['school'] as String? ?? "",
      governorate: map['governorate'] as String? ?? "",
      subject: map['material'] as String? ?? "",
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      password,
      email,
      className!,
      id!,
      mobile!,
      image!,
      roleName,
      area,
      school,
      governorate,
      subject!
    ];
  }
}
