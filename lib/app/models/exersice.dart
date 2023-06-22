import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  final String? id;
  final String arName;
  final List<dynamic> quesiotnsNum;
  final List<dynamic> viewNum;

  const ExerciseModel({
    required this.id,
    required this.arName,
    required this.quesiotnsNum,
    required this.viewNum,
  });

  // ExerciseModel copyWith({
  //   String? id,
  //   String? arName,
  //   String? enName,
  // }) {
  //   return ExerciseModel(
  //     id: id ?? this.id,
  //     arName: arName ?? this.arName,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'exam_Name': arName,
      'question': quesiotnsNum,
      'creatdUser': viewNum
    };
  }

  factory ExerciseModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ExerciseModel(
      id: map['_id'] as String,
      arName: map['exam_Name'] as String,
      quesiotnsNum: map['question'] as List<dynamic>,
      viewNum: map['creatdUser'] as List<dynamic>,
    );
  }

  @override
  List<Object> get props {
    return [arName, quesiotnsNum, viewNum];
  }
}