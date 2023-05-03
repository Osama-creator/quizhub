// import 'package:safar/app/helper/client.dart';
// import 'package:safar/app/models/air_class_model.dart';
// import 'package:safar/app/models/carriers.dart';
// import 'package:safar/app/models/city.dart';
// import 'package:safar/app/models/company.dart';
// import 'package:safar/app/models/country.dart';
// import 'package:safar/app/models/faq.dart';
// import 'package:safar/app/models/policy.dart';
// import 'package:safar/app/models/sittings.dart';
// import 'package:safar/app/views/nationality.dart';
// import 'package:safar/config/endpoints.dart';

// class CommonService {
//   final ApiClient client;

//   CommonService(this.client);

//   Future<PolicyModel> findSitePolicy() async {
//     final res = await client.get(Endpoints.sitePolicy);
//     throwIfNot(200, res);
//     return PolicyModel.fromMap(
//       (res.data as List).first as Map<String, dynamic>,
//     );
//   }

//   Future<PolicyModel> findServicePolicy() async {
//     final res = await client.get(Endpoints.servicePolicy);
//     throwIfNot(200, res);
//     return PolicyModel.fromMap(
//       (res.data as List).first as Map<String, dynamic>,
//     );
//   }

//   Future<SettingsModel> findSettingsData() async {
//     final res = await client.get(Endpoints.settings);
//     throwIfNot(200, res);
//     return SettingsModel.fromMap(
//       res.data as Map<String, dynamic>,
//     );
//   }

//   Future<PolicyModel> findServiceRoles() async {
//     final res = await client.get(Endpoints.serviceRoles);
//     throwIfNot(200, res);
//     return PolicyModel.fromMap(
//       (res.data as List).first as Map<String, dynamic>,
//     );
//   }

//   Future<List<FaqModel>> findManyFaq() async {
//     final res = await client.get(Endpoints.faq);
//     throwIfNot(200, res);
//     return List.from((res.data as List).first as List)
//         .map(
//           (e) => FaqModel.fromMap(
//             e as Map<String, dynamic>,
//           ),
//         )
//         .toList();
//   }

//   Future<List<NationalityModel>> findNationalities() async {
//     final res = await client.get(Endpoints.nationalities);
//     throwIfNot(200, res);
//     return (res.data as Map<String, dynamic>)
//         .entries
//         .map(
//           (e) => NationalityModel(
//             id: e.key,
//             name: e.value.toString(),
//           ),
//         )
//         .toList();
//   }

//   Future<List<CompanyModel>> findManyCompanies() async {
//     final res = await client.get(Endpoints.companies);
//     throwIfNot(200, res);
//     return List.from(res.data as List)
//         .map(
//           (e) => CompanyModel.fromMap(
//             e as Map<String, dynamic>,
//           ),
//         )
//         .toList();
//   }

//   Future<List<CountryModel>> findManyCountry() async {
//     final res = await client.get(Endpoints.faq);
//     throwIfNot(200, res);
//     return List.from(res.data as List)
//         .map(
//           (e) => CountryModel.fromMap(
//             e as Map<String, dynamic>,
//           ),
//         )
//         .toList();
//   }

//   Future<List<CityModel>> findCitiesByCountry(int countryId) async {
//     final res = await client.get('${Endpoints.cities}/$countryId');
//     throwIfNot(200, res);
//     return (res.data as Map)
//         .entries
//         .map<CityModel>(
//           (e) => CityModel(
//             id: int.parse(e.key as String),
//             title: e.value as String,
//           ),
//         )
//         .toList();
//   }

//   Future<List<String>> getCitiesList() async {
//     final res = await client.get(Endpoints.citiesList);
//     throwIfNot(200, res);
//     return (res.data as List<dynamic>).cast<String>();
//   }

//   Future<List<CarriersModel>> findCarriers() async {
//     final res = await client.get(Endpoints.carriers);
//     throwIfNot(200, res);
//     return (res.data as Map<String, dynamic>)
//         .entries
//         .map(
//           (e) => CarriersModel(
//             id: e.key,
//             name: e.value.toString(),
//           ),
//         )
//         .toList();
//   }

//   Future<List<AirClassModel>> getAirReservationClasses() async {
//     final res = await client.get(Endpoints.classes);
//     throwIfNot(200, res);
//     return (res.data as Map<String, dynamic>)
//         .entries
//         .map(
//           (e) => AirClassModel(
//             id: e.key,
//             name: e.value.toString(),
//           ),
//         )
//         .toList();
//   }
// }
