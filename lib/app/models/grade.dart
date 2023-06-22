import 'package:equatable/equatable.dart';

class GradeModel extends Equatable {
  final String? id;
  final String arName;

  const GradeModel({
    this.id,
    required this.arName,
  });

  GradeModel copyWith({
    String? id,
    String? arName,
    String? enName,
  }) {
    return GradeModel(
      id: id ?? this.id,
      arName: arName ?? this.arName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'grades': arName,
    };
  }

  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['_id'] as String,
      arName: map['grades'] as String,
    );
  }

  @override
  List<Object> get props {
    return [
      arName,
    ];
  }
}
