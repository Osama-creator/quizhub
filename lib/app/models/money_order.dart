import 'package:quizhub/app/models/teacher_model.dart';

class MoneyOrder {
  final String id;
  final int phone;
  final int amount;
  final Teacher teacher;
  final bool confirmed;
  final DateTime createdAt;

  MoneyOrder({
    required this.id,
    required this.phone,
    required this.amount,
    required this.teacher,
    required this.confirmed,
    required this.createdAt,
  });

  factory MoneyOrder.fromJson(Map<String, dynamic> json) {
    return MoneyOrder(
      id: json['_id'] as String,
      phone: json['phone'] as int,
      amount: json['amount'] as int,
      teacher: Teacher.fromJson(json['idTeacher'] as Map<String, dynamic>),
      confirmed: json['confirmed'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
