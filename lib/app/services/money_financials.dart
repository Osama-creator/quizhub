// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:quizhub/app/models/financials_model.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/models/teacher_prv_requist.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/func.dart';

class FinancialsService {
  final ApiClient client;

  FinancialsService(this.client);
  Future<void> addFolowersToTeacher({
    required String teacherId,
    required String folowersNumber,
  }) async {
    try {
      final response = await client.post(
        Endpoints.addfollowersEP,
        body: {
          "idTeacher": teacherId,
          "addFolowers": int.parse(folowersNumber)
        },
      );

      if (response.statusCode == 200) {
        log("done");
      } else {
        throw Exception('Failed to add f');
      }
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<void> orderForMoney({
    required String teacherId,
    required int phone,
    required int amount,
  }) async {
    try {
      final response = await client.post(
        Endpoints.teacherMoneyOrder,
        body: {"idTeacher": teacherId, "amount": amount, "phone": phone},
      );

      if (response.statusCode == 200) {
        log("done");
      } else {
        throw Exception('Failed to add f');
      }
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<void> confirmAddFOrder({
    required String teacherId,
    required String replay,
  }) async {
    try {
      final response = await client.post(
        Endpoints.confirmOrder,
        body: {"idTeacher": teacherId, "text": replay},
      );

      if (response.statusCode == 200) {
        log("done");
      } else {
        throw Exception('Failed to add f');
      }
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<List<TeacherOreders>> getAddFoOrdersListForAdmin() async {
    try {
      final response = await client.get(
        Endpoints.getAddFOrders,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['teachers'] as List<dynamic>;
        final teachers = data
            .map(
              (item) => TeacherOreders.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        return teachers;
      } else {
        throw Exception('Failed to add f');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<List<PreviousRequest>> getTeacherPrvReq({required String id}) async {
    try {
      final response =
          await client.post(Endpoints.teacherOrders, body: {"idTeacher": id});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['orders'] as List<dynamic>;
        final orders = data
            .map(
              (item) => PreviousRequest.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        return orders;
      } else {
        throw Exception('Failed to get teacher orders ');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<FinancialsModel> getfinancialsData({required String teacherId}) async {
    try {
      final response = await client.post(
        Endpoints.getFinancialData,
        body: {"idTeacher": teacherId},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final financials = FinancialsModel.fromJson(data);
        return financials;
      } else {
        throw Exception('Failed to get money data ');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }
}
