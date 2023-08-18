// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:quizhub/app/models/advice.dart';
import 'package:quizhub/app/models/money_order.dart';
import 'package:quizhub/app/models/school.dart';
import 'package:quizhub/app/models/school_details.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/models/teacher_prv_requist.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/func.dart';

class AdminService {
  final ApiClient client;

  AdminService(this.client);

  Future<List<SchoolModel>> getSchoolList() async {
    try {
      final response = await client.get(Endpoints.getSchoolsForAdmin);

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;

        final List<SchoolModel> schools = responseData
            .map((item) => SchoolModel.fromJson(item as Map<String, dynamic>))
            .toList();

        final uniqueSchools = schools.toSet().toList();

        return uniqueSchools;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Failed to fetch data');
    }
  }

  Future<SchoolDetailsModel> getSchoolMembers({
    required String schoolName,
  }) async {
    try {
      final response = await client.post(
        Endpoints.getDetailsSchoolsForAdmin,
        body: {"nameSchool": schoolName},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;
        SchoolDetailsModel.fromJson(responseData).students.toSet().toList();
        final SchoolDetailsModel school =
            SchoolDetailsModel.fromJson(responseData);

        return school;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<TeacherModel>> getNonConfirmedAccounts() async {
    try {
      final response = await client.get(
        Endpoints.getAccountOrder,
      );

      if (response.statusCode == 200) {
        final ordersList = response.data['teachers'] as List<dynamic>;
        final orders = ordersList
            .map(
              (json) => TeacherModel.fromMap(
                json as Map<String, dynamic>,
                doneExams: [],
                exams: [],
              ),
            )
            .toList();
        return orders;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> confirmMoneyOrder({
    required String idOrder,
    String? title,
    required File? img,
  }) async {
    final formData = FormData();
    formData.fields.addAll([
      MapEntry("idOrder", idOrder),
      MapEntry("title", title ?? ""),
    ]);
    if (img != null) {
      final String fileName = img.path.split('/').last;
      String? mimeType = mime(fileName);
      final String mimee = mimeType!.split('/')[0];
      final String type = mimeType.split('/')[1];
      formData.files.add(
        MapEntry(
          'img',
          await MultipartFile.fromFile(
            img.path,
            filename: fileName,
            contentType: MediaType(mimee, type),
          ),
        ),
      );
    }
    try {
      final response = await client.post(
        Endpoints.confirmationOfMoneyOrder,
        body: formData,
        contentType: 'multipart/form-data',
      );
      if (response.statusCode == 200 &&
          response.data["message"] as String == "Done") {
        log("confirm done");
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Failed to post data');
    }
  }

  Future<List<MoneyOrder>> getMoneyOrders() async {
    try {
      final response = await client.get(Endpoints.moneyOrdres);

      if (response.statusCode == 200) {
        final ordersList = response.data['orders'] as List<dynamic>;
        final orders = ordersList
            .map((json) => MoneyOrder.fromJson(json as Map<String, dynamic>))
            .toList();
        return orders;
      } else {
        throw Exception('Failed to fetch orders');
      }
    } catch (e, st) {
      catchLog(0, st);
      throw Exception('Failed to fetch orders: $e');
    }
  }

  Future<void> confirmAccount(String teacherId) async {
    try {
      final response = await client.post(
        Endpoints.confirmationOfaccount,
        body: {"idTeacher": teacherId, "message": "confirm"},
      );

      if (response.statusCode == 200) {
        log("confirmed");
      } else {
        throw Exception('Failed to fetch orders');
      }
    } catch (e, st) {
      catchLog(0, st);
      throw Exception('Failed to fetch orders: $e');
    }
  }

  Future<void> postAdvice({
    required String title,
    required String body,
    required String userRole,
  }) async {
    try {
      final response = await client.post(
        Endpoints.addAdvice,
        body: {"body": body, "title": title, "to": userRole},
      );

      if (response.statusCode == 200) {
        log("done ");
      } else {
        throw Exception('Failed to post advice');
      }
    } catch (e, st) {
      catchLog(0, st);
    }
  }

  Future<List<Advice>> getAdvices({
    required String userId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.getAdvice,
        body: {
          "id": userId,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse =
            response.data as Map<String, dynamic>;
        final List<dynamic> advicesData =
            jsonResponse['advices'] as List<dynamic>;

        if (advicesData.isNotEmpty) {
          final List<Advice> advices = advicesData.map((adviceData) {
            return Advice.fromMap(adviceData as Map<String, dynamic>);
          }).toList();

          return advices;
        } else {
          throw Exception('No advice found');
        }
      } else {
        throw Exception('Failed to fetch advices');
      }
    } catch (e, st) {
      catchLog(0, st);
      throw Exception('Failed to fetch advices');
    }
  }

  Future<OrderResponse> fetchOrderResponse({
    required String teacherId,
    required String orderId,
  }) async {
    try {
      final Response response = await client.post(
        Endpoints.confirmationOfMoneyOrderResponse,
        body: {"idTeacher": teacherId, "idOrder": orderId},
      );
      if (response.statusCode == 200 &&
          response.data["message"] as String == "Done") {
        final OrderResponse orderResponse = OrderResponse.fromJson(
          response.data["orders"] as Map<String, dynamic>,
        );

        return orderResponse;
      } else {
        throw Exception(
          'Request failed with status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
