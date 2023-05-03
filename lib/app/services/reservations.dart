// import 'package:safar/app/helper/client.dart';
// import 'package:safar/app/models/dto/booking.dart';
// import 'package:safar/app/models/flight_search.dart';
// import 'package:safar/app/models/reservable.dart';
// import 'package:safar/app/models/reservation.dart';
// import 'package:safar/app/modules/booking/controllers/booking_controller.dart';
// import 'package:safar/app/services/auth.dart';
// import 'package:safar/config/endpoints.dart';

// class ReservationService {
//   final ApiClient client;

//   ReservationService(this.client);

//   Future<ReservationModel> book(
//     List<Passenger> passengers,
//     Reservable trip,
//   ) async {
//     String? reservationNumber;
//     // throw trip.isBus ? Endpoints.bookingBus : Endpoints.bookingFlight;
//     for (final p in passengers) {
//       final res = await client.post(
//         trip.isBus ? Endpoints.bookingBus : Endpoints.bookingFlight,
//         attachToken: AuthService(client).isLoggedIn,
//         body: {
//           ...BookingDto(
//             passengerName: p.nameC.text,
//             familyName: p.familyNameC.text,
//             gender: p.gender,
//             nationality: p.country,
//             passport: p.passportC.text,
//             birthYear: p.birthDay,
//             mobile: p.phone.text,
//             trip: trip,
//           ).toMap(),
//           if (reservationNumber != null)
//             'reservation_number': reservationNumber,
//           if (trip.isFlight) 'flight': (trip.origional as FlightSearchModel).id,
//         },
//       );
//       throwIfNot(200, res);
//       reservationNumber ??= (res.data as Map)['reservation_number'] as String;
//     }
//     // {
//     // "reservation_number": "222231668210",
//     // "ticket_number": "T2231668289",
//     // "redirect": "https://safarsmart.net/reservations/bus/222231668210/show"
//     // }
//     return trip.isBus
//         ? byNumber(reservationNumber!)
//         : byFlightNumber(reservationNumber!);
//   }

//   Future<ReservationModel> byNumber(
//     String keyword,
//   ) async {
//     final res = await client.get(
//       '${Endpoints.lookupBusReservationNumber}/$keyword',
//       attachToken: false,
//     );
//     throwIfNot(200, res);
//     return ReservationModel.fromMap(
//       {
//         'is_paid': (res.data as Map<String, dynamic>)['is_paid'],
//         ...((res.data as Map<String, dynamic>)['car_reservation'] as List).first
//             as Map<String, dynamic>
//       },
//     );
//   }

//   Future<ReservationModel> byFlightNumber(
//     String keyword,
//   ) async {
//     final res = await client.get(
//       '${Endpoints.lookupFlightReservationNumber}/$keyword',
//       attachToken: false,
//     );
//     throwIfNot(200, res);
//     return ReservationModel.fromMap(
//       {
//         'is_paid': (res.data as Map<String, dynamic>)['is_paid'],
//         ...((res.data as Map<String, dynamic>)['flight_reservation'] as List)
//             .first as Map<String, dynamic>
//       },
//     );
//   }

//   Future<ReservationModel> findByTicket(String keyword) async {
//     final res = await client.get(
//       '${Endpoints.lookupBusTicket}/$keyword',
//       attachToken: false,
//     );
//     throwIfNot(200, res);
//     return ReservationModel.fromMap({
//       'is_paid': (res.data as Map<String, dynamic>)['is_paid'],
//       ...(res.data as Map<String, dynamic>)['car_reservation']
//           as Map<String, dynamic>,
//     });
//   }

//   Future<ReservationModel> findFlightByTicket(String keyword) async {
//     final res = await client.get(
//       '${Endpoints.lookupFlightTicket}/$keyword',
//       attachToken: false,
//     );
//     throwIfNot(200, res);
//     return ReservationModel.fromMap({
//       // 'is_paid': (res.data as Map<String, dynamic>)['is_paid'],
//       ...(res.data as Map<String, dynamic>)['flight_reservation']
//           as Map<String, dynamic>,
//     });
//   }

//   Future<String> cancelOne(
//     String ticketNumber,
//   ) async {
//     final res = await client.post(
//       '${Endpoints.cancelTicket}/$ticketNumber',
//     );
//     throwIfNot(200, res);

//     return (res.data as Map)['message'].toString();
//   }
// }
