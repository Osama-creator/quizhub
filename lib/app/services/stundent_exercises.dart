import 'dart:developer';

import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class StudentExamsService {
  final ApiClient client;

  StudentExamsService(this.client);

  Future<void> postDegree({
    required String idUser,
    required int degree,
    required String idexam,
  }) async {
    try {
      final response = await client.post(
        Endpoints.postDegree,
        body: {"idUser": idUser, "degree": degree, "idexam": idexam},
      );

      if (response.statusCode == 200) {
        log("post has done succfully $degree");
      } else {
        throw Exception('Failed to fetch exercises');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<List<User>> fetchStudentToEnvite({
    required String userId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.getUseres,
        body: {
          'idUser': userId,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;

        final userList = (responseData['getallUser'] as List<dynamic>)
            .map((json) => User.fromJson(json as Map<String, dynamic>))
            .toList();

        return userList;
      } else {
        throw Exception('Failed to fetch user list');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }

  Future<void> eviteFriend({
    required String forwordUserId,
    required String examId,
    required String userId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.getUseres,
        body: {
          "iduser": "6495d071a13af5b54e73ab3f",
          "idExam": "6495888458c9a0a165992a8a",
          "IdToUser": "64986f53aefa7c31aa92b129"
        },
      );

      if (response.statusCode == 200) {
        log("envite done $forwordUserId");
      } else {
        throw Exception('Failed to fetch user list');
      }
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }
}
