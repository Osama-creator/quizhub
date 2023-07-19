// ignore_for_file: avoid_dynamic_calls

import 'package:quizhub/app/models/school.dart';
import 'package:quizhub/app/models/school_details.dart';
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
}
