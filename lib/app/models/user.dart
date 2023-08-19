// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class User extends Equatable {
  String id;
  String name;
  String? role;
  String profilePic;
  bool? invited;

  User({
    required this.id,
    required this.name,
    this.profilePic = '',
    this.role,
    this.invited = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      name: json['name'] as String,
      role: json['role'] as String? ?? "",
      profilePic: json['profile_pic'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, profilePic, invited, role];
}
