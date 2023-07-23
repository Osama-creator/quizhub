import 'package:quizhub/app/models/user.dart';

class Comment {
  final String id;
  final String commBody;
  final User createdBy;
  final List<User> likes;
  bool? like;

  Comment({
    required this.id,
    required this.commBody,
    required this.createdBy,
    required this.likes,
    this.like = false,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'] as String,
      commBody: json['commBody'] as String,
      createdBy: User.fromJson(json['createdby'] as Map<String, dynamic>),
      likes: (json['likes'] as List)
          .map((like) => User.fromJson(like as Map<String, dynamic>))
          .toList(),
    );
  }
}
