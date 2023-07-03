import 'package:equatable/equatable.dart';

class SchoolModel extends Equatable {
  final String name;
  final int users;

  const SchoolModel({required this.name, required this.users});

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      name: json['schools'] as String,
      users: json['users'] as int,
    );
  }

  @override
  List<Object?> get props => [name, users];
}
