// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:quizhub/app/models/exams_card.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/models/questions.dart';
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
          'idUser': "6495d071a13af5b54e73ab3f",
          'subject': subject,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        final List<ExerciseCardModel> exercisesCardList = [];
        final List<dynamic> dataList = responseData['arr'] as List<dynamic>;

        for (final data in dataList) {
          final String teacherName = data['teacher']['name'] as String;
          final List<dynamic> examList = data['exam'] as List<dynamic>;

          final List<ExerciseModel> exercises = examList.map((exerciseData) {
            return ExerciseModel.fromMap(exerciseData as Map<String, dynamic>);
          }).toList();

          exercisesCardList.add(
            ExerciseCardModel(
              teacherName: teacherName,
              exercises: exercises,
            ),
          );
        }

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

          if (data['exam'] != null &&
              (data['exam'] as List<dynamic>).isNotEmpty) {
            final List<dynamic> examList = data['exam'] as List<dynamic>;

            final List<ExerciseModel> exams = examList.map((exam) {
              return ExerciseModel.fromMap(exam as Map<String, dynamic>);
            }).toList();

            subjectExams[teacherName] = exams;
          }
        }

        return subjectExams;
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<String>> fetchTeacherNames(String userId, String subject) async {
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

        final List<String> teacherNames = [];

        for (final data in arr) {
          final String teacherName = data['teacher']['name'] as String;
          if (!teacherNames.contains(teacherName)) {
            teacherNames.add(teacherName);
          }
        }

        return teacherNames;
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
          'idUser': "6495d071a13af5b54e73ab3f",
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

  Future<void> postMcqQuestion(McqQuestion mcqQuestion) async {
    try {
      final response = await client.post(
        Endpoints.addQuesiton,
        body: mcqQuestion.toJson(),
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

  Future<List<McqQuestion>> getExercise({
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
      final List<McqQuestion> questions = [];
      final List<dynamic> dataList = responseData['getexam'] as List<dynamic>;
      for (final data in dataList) {
        final List<dynamic> getQuestions = data['question'] as List<dynamic>;
        for (final questionData in getQuestions) {
          final McqQuestion question =
              McqQuestion.fromJson(questionData as Map<String, dynamic>);
          questions.add(question);
        }
      }
      log(' successfully');
      return questions;
    } else {
      throw Exception('Failed');
    }
  }
}
