// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/func.dart';

class TeacherService {
  final ApiClient client;

  TeacherService(this.client);

  Future<List<Teacher>> fetchTeachers(String idUser) async {
    try {
      final response = await client.post(
        Endpoints.getTeachers,
        body: {
          'idUesr': idUser,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        final teachers = responseData
            .expand((list) => list as List<dynamic>)
            .map((item) => Teacher.fromJson(item as Map<String, dynamic>))
            .toList();

        return teachers;
      } else {
        throw Exception('Failed to fetch teachers');
      }
    } catch (e, st) {
      // Handle error
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<TeacherModel> getFolowedTeachers(
      {required String idTeacher, required String userId}) async {
    try {
      final response = await client.post(
        Endpoints.getTeachersummery,
        body: {"idTeacher": idTeacher, "idUser": userId},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;

        final List<dynamic> theGrades =
            responseData['thegrades'] as List<dynamic>;

        final List<ExerciseModel> exams = theGrades
            .expand(
              (grade) => (grade['exam'] as List<dynamic>)
                  .map(
                    (exam) =>
                        ExerciseModel.fromMap(exam as Map<String, dynamic>),
                  )
                  .toList(),
            )
            .toList();
        final TeacherModel teacher = TeacherModel.fromMap(
          responseData['Teacher'] as Map<String, dynamic>,
          exams: exams,
        );

        return teacher;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<Teacher>> fetchFolowedTeachers(String idGuardian) async {
    try {
      final response = await client.post(
        Endpoints.getFolowedTeacher,
        body: {
          'idUesr': idGuardian,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['getallTeacher'] as List<dynamic>;
        final teachers = responseData
            .map((item) => Teacher.fromJson(item as Map<String, dynamic>))
            .toList();

        return teachers;
      } else {
        throw Exception('Failed to fetch teachers');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<void> folowTeacher({
    required String idTeacher,
    required String idUser,
  }) async {
    try {
      final response = await client.post(
        Endpoints.folowTeacher,
        body: {"idUser": idUser, "idTeacher": idTeacher},
      );

      if (response.statusCode == 200) {
        log("folowed done");
      } else {
        throw Exception('Failed to fetch students');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
