// import 'package:safar/app/helper/client.dart';
// import 'package:safar/app/models/bus_search_result.dart';
// import 'package:safar/app/models/dto/search.dart';
// import 'package:safar/app/models/flight_search_result.dart';
// import 'package:safar/config/endpoints.dart';

// class SearchService {
//   final ApiClient client;

//   SearchService(this.client);

//   Future<BusSearchResult> searchBus(SearchDto dto) async {
//     final res = await client.customGet(
//       Endpoints.searchBus,
//       query: dto.toMap(),
//     );
//     throwIfNot(200, res);
//     return BusSearchResult.fromMap(res.data as Map<String, dynamic>);
//   }

//   Future<FlightSearchResult> searchFlight(SearchDto dto) async {
//     final res = await client.customGet(
//       Endpoints.searchFlight,
//       body: dto.toMap(),
//     );
//     throwIfNot(200, res);

//     return FlightSearchResult.fromMap(res.data as Map<String, dynamic>);
//   }
// }
