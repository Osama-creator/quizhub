import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String name;
  final String school;
  final String governorate;
  final String area;
  final String email;
  final String? mobile;
  final String password;
  final String confirmPassword;
  final String roleName;
  final String className;
  final String? image;
  const UserModel({
    this.id,
    required this.name,
    required this.school,
    required this.governorate,
    required this.area,
    required this.confirmPassword,
    required this.email,
    this.mobile,
    required this.className,
    required this.password,
    required this.roleName,
    this.image,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? roleName,
    String? image,
    String? className,
    String? school,
    String? area,
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
      confirmPassword: image ?? this.confirmPassword,
      school: image ?? this.school,
      area: image ?? this.area,
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
      'the_line': className,
      'school': school,
      'governorate': governorate,
      'confirm_Password': confirmPassword,
      'Area': area
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['phoneNum'] as String,
      password: map['password'] as String,
      image: map['image'] as String,
      roleName: map['roleName'] as String,
      className: map['the_line'] as String,
      area: map['Area'] as String,
      school: map['school'] as String,
      governorate: map['governorate'] as String,
      confirmPassword: map['confirm_Password'] as String,
    );
  }

  @override
  List<Object> get props {
    return [name, email, password, email, className];
  }
}
