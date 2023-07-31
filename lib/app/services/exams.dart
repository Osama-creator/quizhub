// ignore_for_file: avoid_dynamic_calls, prefer_final_locals

import 'dart:developer';

import 'package:http/http.dart' as http;
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
                exerciseData as Map<String, dynamic>);
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
        exercisesCardList.removeWhere((element) => element.exercises.isEmpty);
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
    // List<int> imageBytes = File(question.image!.path).readAsBytesSync();
    // final String baseimage = base64Encode(imageBytes);

    // log(question.image!.path);
    try {
      final request = http.MultipartRequest(
        "POST",
        Uri.parse("http://192.168.0.106:4500/Node.js/api/v6/com/addQuestion"),
      );
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.headers.addAll(headers);

      request.fields['correct_Answer'] = question.rightAnswer;
      request.fields['choose2'] = question.wrongAns1!;
      request.fields['choose3'] = question.wrongAns2!;
      request.fields['choose4'] = question.wrongAns3!;
      request.fields['test_node'] = question.note!;
      request.fields['question'] = question.question;
      request.fields['createdby'] = question.teacherId;
      request.fields['Idexam'] = question.examId;
      // request.fields['Idexam'] = question.examId;

      // request.files.add(
      //   http.MultipartFile.fromBytes(
      //     'image',
      //     File(question.image!.path).readAsBytesSync(),
      //     filename: question.image!.path.split("/").last,
      //   ),
      // );

      request.send().then((response) {
        if (response.statusCode == 200) {
          log("Uploaded!");
        } else {}
      });
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }
  // Future<void> postMcqQuestion(McqQuestion question) async {
  //   try {
  //     final dio = Dio();
  //     final formData = FormData();

  //     formData.fields.addAll([
  //       MapEntry('correct_Answer', question.rightAnswer),
  //       MapEntry('choose2', question.wrongAns1!),
  //       MapEntry('choose3', question.wrongAns2!),
  //       MapEntry('choose4', question.wrongAns3!),
  //       MapEntry('test_node', question.note!),
  //       MapEntry('question', question.question),
  //       MapEntry('createdby', question.teacherId),
  //       MapEntry('Idexam', question.examId),
  //     ]);

  //     final file = File(question.image!.path);
  //     formData.files.add(
  //       MapEntry(
  //         'image',
  //         await MultipartFile.fromFile(
  //           file.path,
  //           filename: file.path.split('/').last,
  //         ),
  //       ),
  //     );

  //     final response = await dio.post(
  //       'http://192.168.0.106:4500/Node.js/api/v6/com/addQuestion',
  //       data: formData,
  //       options: Options(contentType: 'multipart/form-data'),
  //     );

  //     if (response.statusCode == 200) {
  //       log('Uploaded!');
  //     } else {
  //       log('Error');
  //     }
  //   } catch (e, st) {
  //     log('Error: $e, $st');
  //     throw Exception('Error: $e, $st');
  //   }
  // }

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
