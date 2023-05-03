// import 'package:safar/app/helper/client.dart';
// import 'package:safar/app/models/bus_offer.dart';
// import 'package:safar/config/endpoints.dart';

// class DiscoverService {
//   final ApiClient client;

//   DiscoverService(this.client);

//   Future<List<BusOfferModel>> discoverBusOffers() async {
//     final res = await client.get(Endpoints.discoverBusOffers);
//     throwIfNot(200, res);
//     // ignore: avoid_dynamic_calls
//     return ((res.data as Map)['bus_trips']['data'] as List)
//         .map((e) => BusOfferModel.fromMap(e as Map<String, dynamic>))
//         .toList();
//   }
// }
