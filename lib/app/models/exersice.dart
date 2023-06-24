import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  final String? id;
  final String arName;
  final String type;
  final List<dynamic> quesiotnsNum;
  final List<dynamic> viewNum;

  const ExerciseModel({
    required this.id,
    required this.arName,
    required this.quesiotnsNum,
    required this.viewNum,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'exam_Name': arName,
      'question': quesiotnsNum,
      'creatdUser': viewNum,
      'kindOf_questions': type
    };
  }

  factory ExerciseModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ExerciseModel(
      id: map['_id'] as String,
      arName: map['exam_Name'] as String,
      type: map['kindOf_questions'] as String,
      quesiotnsNum: map['question'] as List<dynamic>,
      viewNum: map['creatdUser'] as List<dynamic>,
    );
  }

  @override
  List<Object> get props {
    return [arName, quesiotnsNum, viewNum, type];
  }
}
