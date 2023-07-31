import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  final String? id;
  final String? arName;
  final String? type;
  final String? subName;
  final List<dynamic>? quesiotnsNum;
  final List<dynamic>? viewNum;
  final int? degree;

  const ExerciseModel({
    this.id,
    this.arName,
    this.quesiotnsNum,
    this.viewNum,
    this.type,
    this.degree,
    this.subName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'exam_Name': arName,
      'question': quesiotnsNum,
      'creatdUser': viewNum,
      'kindOf_questions': type,
      'degree': degree,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('idexam')) {
      final examData = map['idexam'] as Map<String, dynamic>;
      return ExerciseModel(
        id: examData['_id'] as String,
        arName: examData['exam_Name'] as String,
        type: examData['kindOf_questions'] as String,
        quesiotnsNum: examData['question'] as List<dynamic>,
        viewNum: examData['creatdUser'] as List<dynamic>,
        degree: map['degree'] as int? ?? 0,
      );
    } else {
      return ExerciseModel(
        id: map['_id'] as String?,
        arName: map['exam_Name'] as String?,
        type: map['kindOf_questions'] as String?,
        quesiotnsNum: map['question'] as List<dynamic>?,
        viewNum: map['creatdUser'] as List<dynamic>?,
        degree: map['degree'] as int?,
      );
    }
  }

  @override
  List<Object?> get props {
    return [arName, quesiotnsNum, viewNum, type, degree];
  }
}

class ExerciseModel2 extends Equatable {
  final String? id;
  final String arName;
  final String subjectName;
  final List<dynamic> quesiotnsNum;
  final int degree;

  const ExerciseModel2({
    required this.id,
    required this.arName,
    required this.quesiotnsNum,
    required this.degree,
    required this.subjectName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'exam_Name': arName,
      'question': quesiotnsNum,
      'degree': degree,
      'subject_Name': subjectName
    };
  }

  factory ExerciseModel2.fromMap(
    Map<String, dynamic> map,
  ) {
    return ExerciseModel2(
      id: map['_id'] as String,
      arName: map['exam_Name'] as String,
      degree: map['degree'] as int,
      quesiotnsNum: map['question'] as List<dynamic>,
      subjectName: map['subject_Name'] as String,
    );
  }

  @override
  List<Object> get props {
    return [arName, quesiotnsNum, subjectName, degree];
  }
}

class DoneExerciseModel extends Equatable {
  final ExerciseModel exerciseModel;
  final int degree;

  const DoneExerciseModel({
    required this.exerciseModel,
    required this.degree,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'degree': degree, 'idexam': exerciseModel};
  }

  factory DoneExerciseModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return DoneExerciseModel(
      degree: map['degree'] as int,
      exerciseModel:
          ExerciseModel.fromMap(map["idexam"] as Map<String, dynamic>),
    );
  }

  @override
  List<Object> get props {
    return [exerciseModel, degree];
  }
}
