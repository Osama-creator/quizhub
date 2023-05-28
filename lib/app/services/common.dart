// ignore_for_file: avoid_dynamic_calls

import 'package:quizhub/app/models/city.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class CommonService {
  final ApiClient client;

  CommonService(this.client);

  Future<List<CityModel>> getCitiesList() async {
    final res = await client.get(Endpoints.cities);
    throwIfNot(200, res);

    final List<dynamic> data = res.data['data'] as List<dynamic>;

    final List<CityModel> cities = data.map((cityData) {
      return CityModel.fromMap(cityData as Map<String, dynamic>);
    }).toList();

    return cities;
  }

  Future<List<String>> getSchoolList({
    required String cityId,
  }) async {
    final res = await client.get("${Endpoints.schools}/$cityId");
    throwIfNot(200, res);
    final List<dynamic> data = res.data['schools'] as List<dynamic>;

    final List<String> schoolNames = data.map((item) {
      return item['schoolName'] as String;
    }).toList();

    return schoolNames;
  }
}
