import 'package:equatable/equatable.dart';
import 'package:quizhub/app/models/user.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final User createdBy;
  final DateTime createdAt;
  final String? comments;

  const Post({
    required this.id,
    required this.title,
    required this.createdBy,
    required this.createdAt,
    this.comments = "",
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] as String,
      title: json['title'] as String,
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      // comments: json['comments'] as String,
    );
  }

  @override
  List<Object?> get props => [id, title, createdAt, createdBy, comments];
}
