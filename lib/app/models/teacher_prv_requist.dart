import 'package:equatable/equatable.dart';

class PreviousRequest extends Equatable {
  String id;
  int phone;
  int amount;
  String idTeacher;
  bool confirmed;
  // DateTime createdAt;
  // DateTime updatedAt;

  PreviousRequest({
    required this.id,
    required this.phone,
    required this.amount,
    required this.idTeacher,
    required this.confirmed,
    //  required this.createdAt,
    //  required this.updatedAt,
  });

  factory PreviousRequest.fromJson(Map<String, dynamic> json) {
    return PreviousRequest(
      id: json['_id'] as String,
      phone: json['phone'] as int,
      amount: json['amount'] as int,
      idTeacher: json['idTeacher'] as String,
      confirmed: json['confirmed'] as bool,
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [id, phone, amount, idTeacher, confirmed];
}
