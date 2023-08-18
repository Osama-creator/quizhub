import 'package:equatable/equatable.dart';

class Advice extends Equatable {
  final String title;
  final String body;

  const Advice({
    required this.title,
    required this.body,
  });

  factory Advice.fromMap(Map<String, dynamic> map) {
    return Advice(
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  @override
  List<Object> get props {
    return [title, body];
  }
}
