import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String fName;
  final String lName;
  final String email;
  final String? mobile;
  final String password;
  final String roleName;
  final String? image;
  const UserModel({
    this.id,
    required this.fName,
    required this.lName,
    required this.email,
    this.mobile,
    required this.password,
    required this.roleName,
    this.image,
  });

  UserModel copyWith({
    int? id,
    String? fName,
    String? lName,
    String? email,
    String? password,
    String? mobile,
    String? roleName,
    String? image,
  }) {
    return UserModel(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      password: password ?? this.password,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      roleName: roleName ?? this.roleName,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fName': fName,
      'lName': lName,
      'email': email,
      'password': mobile,
      'img': image,
      'phone': mobile,
      'roleName': roleName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      fName: map['fName'] as String,
      lName: map['lName'] as String,
      email: map['email'] as String,
      mobile: map['phone'] as String,
      password: map['password'] as String,
      image: map['img'] as String,
      roleName: map['roleName'] as String,
    );
  }

  @override
  List<Object> get props {
    return [
      fName,
      email,
      lName,
      password,
      email,
    ];
  }
}
