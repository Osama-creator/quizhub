import 'package:equatable/equatable.dart';
import 'package:quizhub/app/models/exersice.dart';

class ExerciseCardModel extends Equatable {
  final String? id;
  final String teacherName;
  final String? teacherPhoto;
  final List<ExerciseModel> exercises;

  const ExerciseCardModel({
    this.id,
    required this.teacherName,
    this.teacherPhoto,
    required this.exercises,
  });

  @override
  List<Object> get props {
    return [teacherName, teacherPhoto!, id!, exercises];
  }
}
