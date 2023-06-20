// ignore_for_file: avoid_dynamic_calls

import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class CommonService {
  final ApiClient client;

  CommonService(this.client);

  Future<List<String>> getCitiesList() async {
    final res = await client.get(Endpoints.cities);
    throwIfNot(200, res);

    final List<dynamic> governorate = res.data['governorate'] as List<dynamic>;
    final List<String> cities =
        governorate.map((city) => city.toString()).toList();

    return cities;
  }

  Future<List<String>> getGradesList() async {
    final res = await client.get(Endpoints.grades);
    throwIfNot(200, res);

    final List<dynamic> gradesList = res.data['getallgrades'] as List<dynamic>;
    final List<String> grades =
        gradesList.map((grade) => grade.toString()).toList();

    return grades;
  }

  Future<List<String>> getSchoolList({required String city}) async {
    final response = await client.post(
      Endpoints.schools,
      body: {'governorate': city},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch schools');
    }

    final List<dynamic> schoolList = response.data['school'] as List<dynamic>;
    final List<String> schoolNames =
        schoolList.map((item) => item.toString()).toList();

    return schoolNames;
  }
}
