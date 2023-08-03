// ignore_for_file: avoid_dynamic_calls, prefer_final_locals

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:quizhub/app/models/exams_card.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class ExamsService {
  final ApiClient client;

  ExamsService(this.client);

  Future<List<ExerciseModel>> fetchExercises({
    required String teacherId,
    required String gradeId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.gradeExercise,
        body: {
          'idTeacher': teacherId,
          'idgrades': gradeId,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        final List<ExerciseModel> exercises = [];
        final List<dynamic> dataList = responseData['data'] as List<dynamic>;

        for (final data in dataList) {
          final List<dynamic> getExams = data['getexams'] as List<dynamic>;

          for (final exerciseData in getExams) {
            final ExerciseModel exercise =
                ExerciseModel.fromMap(exerciseData as Map<String, dynamic>);
            exercises.add(exercise);
          }
        }

        return exercises;
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<List<ExerciseCardModel>> fetchStudentExercises({
    required String userId,
    required String subject,
  }) async {
    try {
      final response = await client.post(
        Endpoints.getexamswithTeacher,
        body: {
          'idUser': userId,
          'subject': subject,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        final List<ExerciseCardModel> exercisesCardList = [];
        final List<dynamic> dataList = responseData['arr'] as List<dynamic>;

        for (final data in dataList) {
          final String teacherName = data['teacher']['name'] as String;
          final int advantage = data['teacher']['addFolowers'] as int;
          final List<dynamic> examList = data['exam'] as List<dynamic>;
          final List<dynamic> doneExamList =
              data['the_grades'] as List<dynamic>;

          final List<ExerciseModel> exercises = examList.map((exerciseData) {
            return ExerciseModel.fromMap(exerciseData as Map<String, dynamic>);
          }).toList();
          final List<DoneExerciseModel> doneExercises =
              doneExamList.map((exerciseData) {
            return DoneExerciseModel.fromMap(
              exerciseData as Map<String, dynamic>,
            );
          }).toList();

          exercisesCardList.add(
            ExerciseCardModel(
              teacherName: teacherName,
              advantage: advantage,
              exercises: exercises,
              doneExercises: doneExercises,
            ),
          );
        }
        exercisesCardList.sort((a, b) => b.advantage!.compareTo(a.advantage!));
        exercisesCardList.removeWhere(
          (element) =>
              element.exercises.isEmpty && element.doneExercises.isEmpty,
        );
        return exercisesCardList;
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<Map<String, List<ExerciseModel>>> fetchStudentExams(
    String userId,
    String subject,
  ) async {
    try {
      final response = await client.post(
        Endpoints.getexamswithTeacher,
        body: {
          'idUser': userId,
          'subject': subject,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<dynamic> arr = responseData['arr'] as List<dynamic>;

        final Map<String, List<ExerciseModel>> subjectExams = {};

        for (final data in arr) {
          final String teacherName = data['teacher']['name'] as String;

          final List<dynamic> examList = data['exam'] as List<dynamic>;
          final List<dynamic> doneExamList =
              data['the_grades'] as List<dynamic>;
          final List<ExerciseModel> exams = examList.map((exam) {
            return ExerciseModel.fromMap(exam as Map<String, dynamic>);
          }).toList();
          final List<ExerciseModel> done = doneExamList.map((exam) {
            return ExerciseModel.fromMap(exam as Map<String, dynamic>);
          }).toList();

          subjectExams[teacherName] = exams + done;
        }

        return subjectExams;
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<User>> fetchTeacherNames(String userId, String subject) async {
    try {
      final response = await client.post(
        Endpoints.getexamswithTeacher,
        body: {
          'idUser': userId,
          'subject': subject,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<dynamic> arr = responseData['arr'] as List<dynamic>;

        final List<User> teachers = [];

        for (final data in arr) {
          final teacherName = data['teacher'] as Map<String, dynamic>;
          final User teacher = User.fromJson(teacherName);
          if (!teachers.contains(teacher)) {
            teachers.add(teacher);
          }
        }
        return teachers;
      } else {
        throw Exception('Failed to fetch teacher names');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<String>> fetchStudentHomeSubjectNames(String userId) async {
    try {
      final response = await client.post(
        Endpoints.subjectNames,
        body: {
          'idUser': userId,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        final List<dynamic> nameSubjects =
            responseData['nameSubjects'] as List<dynamic>;
        final List<String> uniqueSubjectNames = [];

        for (final subjectData in nameSubjects) {
          final String subjectName = subjectData['subject_Name'] as String;

          if (!uniqueSubjectNames.contains(subjectName)) {
            uniqueSubjectNames.add(subjectName);
          }
        }

        return uniqueSubjectNames;
      } else {
        throw Exception('Failed to fetch subject names');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<String> createExam({
    required String examName,
    required String examType,
    required String gradeId,
    required String teacherId,
    required int examTime,
  }) async {
    try {
      final response = await client.post(
        Endpoints.addExam,
        body: {
          'exam_Name': examName,
          'kindOf_questions': examType,
          'createdby': teacherId,
          'time': examTime,
          'Idgrades': gradeId
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        final id = responseData['date']["_id"] as String;

        return id;
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<void> deleteExam({
    required String examId,
  }) async {
    try {
      final response = await client.delete(
        Endpoints.deletExam,
        body: {
          'idexam': examId,
        },
      );

      if (response.statusCode == 200) {
        log("Done");
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<void> postMcqQuestion(McqQuestion question) async {
    try {
      final dio = Dio();
      final formData = FormData();

      formData.fields.addAll([
        MapEntry('correct_Answer', question.rightAnswer),
        if (question.wrongAns1 != null && question.wrongAns1!.isNotEmpty)
          MapEntry('choose2', question.wrongAns1!),
        if (question.wrongAns2 != null && question.wrongAns2!.isNotEmpty)
          MapEntry('choose3', question.wrongAns2!),
        if (question.wrongAns3 != null && question.wrongAns3!.isNotEmpty)
          MapEntry('choose4', question.wrongAns3!),
        if (question.note != null && question.note!.isNotEmpty)
          MapEntry('test_node', question.note!),
        MapEntry('question', question.question),
        MapEntry('createdby', question.teacherId),
        MapEntry('Idexam', question.examId),
      ]);
      if (question.image != null) {
        String fileName = question.image!.path.split('/').last;
        String? mimeType = mime(fileName);
        String mimee = mimeType!.split('/')[0];
        String type = mimeType.split('/')[1];
        formData.files.add(
          MapEntry(
            'img',
            await MultipartFile.fromFile(
              question.image!.path,
              filename: fileName,
              contentType: MediaType(mimee, type),
            ),
          ),
        );
      }
      final options = Options(contentType: 'multipart/form-data');
      final response = await dio.post(
        // Endpoints.addQuesiton,
        "http://192.168.0.106:4500/Node.js/api/v6/com/addQuestion",
        data: formData,
        options: options,
      );
      if (response.statusCode == 200) {
        log("done");
      } else {
        throw Exception(
          'Failed to post question. Status Code: ${response.statusCode}',
        );
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<void> updateQuestion({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await client.patch(
        Endpoints.updateQuesiton,
        body: body,
      );

      if (response.statusCode == 200) {
        // Handle success
        log('Question posted successfully');
      } else {
        // Handle error
        throw Exception('Failed to post question');
      }
    } catch (e, st) {
      // Handle error
      throw Exception('Error: $e, $st');
    }
  }

  Future<Exam> getExercise({
    required String id,
  }) async {
    final response = await client.post(
      Endpoints.getExam,
      body: {
        'Idexam': id,
      },
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      final List<dynamic> dataList = responseData['getexam'] as List<dynamic>;
      final Exam exam = Exam.fromJson(dataList.first as Map<String, dynamic>);
      log(' successfully');
      return exam;
    } else {
      throw Exception('Failed');
    }
  }
}
