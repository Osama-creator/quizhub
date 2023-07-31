import 'dart:developer';

import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/func.dart';

class ParentService {
  final ApiClient client;

  ParentService(this.client);

  Future<List<User>> fetchStudents(String idGuardian) async {
    try {
      final response = await client.post(
        Endpoints.getStudents,
        body: {
          'idGuardian': idGuardian,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['users'] as List<dynamic>;
        final students = data
            .map((item) => User.fromJson(item as Map<String, dynamic>))
            .toList();

        return students;
      } else {
        throw Exception('Failed to fetch students');
      }
    } catch (e) {
      // Handle error
      throw Exception('Error: $e');
    }
  }

  Future<List<User>> fetchFolowedStudents(String idGuardian) async {
    try {
      final response = await client.post(
        Endpoints.folowedStudent,
        body: {
          'idGuardian': idGuardian,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['users'] as List<dynamic>;
        final students = data
            .map((item) => User.fromJson(item as Map<String, dynamic>))
            .toList();

        return students;
      } else {
        throw Exception('Failed to fetch students');
      }
    } catch (e) {
      // Handle error
      throw Exception('Error: $e');
    }
  }

  Future<void> folowStudent(String idGuardian, String idStudent) async {
    try {
      final response = await client.post(
        Endpoints.folowStudent,
        body: {"idStudent": idStudent, "idGuardian": idGuardian},
      );

      if (response.statusCode == 200) {
        log("folowed done");
      } else {
        throw Exception('Failed to fetch students');
      }
    } catch (e) {
      // Handle error
      throw Exception('Error: $e');
    }
  }

  Future<List<ExerciseModel>> fetchExams({
    required String userId,
    required String parentId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.getStudentProfile,
        body: {"isUser": userId, "idParent": parentId},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;

        final List<dynamic> examsData = responseData['exams'] as List<dynamic>;

        final List<ExerciseModel> exams = examsData.map((item) {
          final Map<String, dynamic> examData =
              item['doc'] as Map<String, dynamic>;
          final Map<String, dynamic> idexamData =
              examData['idexam'] as Map<String, dynamic>;
          return ExerciseModel(
            id: idexamData['_id'] as String?,
            arName: idexamData['exam_Name'] as String?,
            subName: idexamData['subject_Name'] as String?,
            type: idexamData['kindOf_questions'] as String?,
            quesiotnsNum: idexamData['question'] as List<dynamic>?,
            viewNum: idexamData['creatdUser'] as List<dynamic>?,
            degree: examData['degree'] as int?,
          );
        }).toList();

        return exams;
      } else {
        // Handle other status codes if needed
        throw Exception('Failed to fetch exams');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }
}
