// import 'dart:io';

// import 'package:queen/queen.dart' hide throwIfNot;
// import 'package:safar/app/helper/client.dart';
// import 'package:safar/app/models/dto/update_profile.dart';
// import 'package:safar/app/models/reservation.dart';
// import 'package:safar/app/models/user.dart';
// import 'package:safar/config/endpoints.dart';

// class AuthService {
//   final ApiClient client;
//   AuthService(this.client);

//   bool get isLoggedIn => Prefs.getString('token').isNotEmpty;

//   bool get isLoggedOut => !isLoggedIn;

//   UserModel? get cachedUser {
//     final user = Prefs.getMap('auth.user');
//     if (user.isEmpty) return null;
//     return UserModel.fromMap(user);
//   }

//   UserModel get user => cachedUser ?? (throw 'user is not logged in !');

//   Future<UserModel> userFromApi() async {
//     final res = await client.get(Endpoints.useFromToken);
//     throwIfNot(200, res);
//     final user = UserModel.fromMap(res.data as Map<String, dynamic>);
//     await Prefs.setMap('auth.user', user.toMap());
//     return user;
//   }

//   Future<void> signIn({
//     required String mobile,
//     required String password,
//   }) async {
//     final res = await client.post(
//       Endpoints.login,
//       body: {
//         'mobile': mobile,
//         'password': password,
//         'device_name': 'flutter-app',
//       },
//     );
//     throwIfNot(200, res);
//     // save the token to shared preferences
//     final String token = (res.data as String).replaceAll('"', '');
//     await Prefs.setString('token', token);
//     await userFromApi();
//   }

//   Future<String> signUp({
//     required String name,
//     required String email,
//     required String countryCode,
//     required String phone,
//     required String password,
//   }) async {
//     final res = await client.post(
//       Endpoints.register,
//       body: {
//         'name': name,
//         'email': email,
//         'code': countryCode,
//         'mobile': phone,
//         'password': password,
//         // 'password_confirmation': passwordConfirmation,
//         'type': 2,
//       },
//     );
//     throwIfNot(200, res);
//     await signIn(mobile: '$countryCode$phone', password: password);
//     return (res.data as Map)['message'] as String;
//   }

//   Future<void> updateProfile({
//     required UpdateProfileDto dto,
//   }) async {
//     final res = await client.patch(
//       Endpoints.updateProfile,
//       body: dto.toMap(),
//     );
//     throwIfNot(HttpStatus.ok, res);
//     await userFromApi();
//   }

//   Future<String> resetPassword({
//     required String email,
//   }) async {
//     final res = await client.post(
//       Endpoints.resetPassword,
//       attachToken: false,
//       body: {
//         'email': email,
//       },
//     );
//     throwIfNot(HttpStatus.ok, res);
//     return (res.data as Map)['message'] as String;
//   }

//   Future<void> signOut() async {
//     await Prefs.removeMany(['token', 'auth.user']);
//     // client.get('/logout');
//   }

//   Future<void> deleteAccount() async {
//     final res = await client.delete(
//       Endpoints.deleteAccount,
//     );
//     throwIfNot(HttpStatus.ok, res);
//     await signOut();
//   }

//   Future<List<ReservationModel>> fetchMyReservations() async {
//     final res = await client.get(Endpoints.profile);
//     throwIfNot(200, res);
//     return ((res.data as Map)['bus_reservations'] as List)
//         .map((e) => ReservationModel.fromMap(e as Map<String, dynamic>))
//         .toList();
//   }

//   // Future<void> changePassword({
//   //   required String oldPassword,
//   //   required String newPassword,
//   //   required String newPasswordConfirmation,
//   // }) async {
//   //   final res = await client.post(
//   //     '/update_password',
//   //     body: {
//   //       'current_password': oldPassword,
//   //       'password': newPassword,
//   //       'confirm_password': newPasswordConfirmation,
//   //     },
//   //   );
//   //   throwIfNot(204, res);
//   // }

//   // Future<void> updateProfile({
//   //   required String name,
//   //   required String email,
//   //   required String phone,
//   //   required Gender gender,
//   //   required int cityId,
//   // }) async {
//   //   final res = await client.post(
//   //     '/update_user',
//   //     body: {
//   //       'name': name,
//   //       'email': email,
//   //       'phone': phone,
//   //       'gender': gender.name,
//   //       'city_id': cityId,
//   //     },
//   //   );
//   //   throwIfNot(200, res);
//   //   // save the token to shared preferences
//   //   final String jwt = (res.data as Map)['token'] as String;
//   //   await Prefs.setString('token', jwt);

//   //   /// save the user to shared preferences
//   //   final userData = (res.data as Map)['user'] as Map<String, dynamic>;
//   //   final user = UserModel.fromMap(userData);
//   //   await Prefs.setMap('auth.user', user.toMap());
//   // }

//   // Future<void> sendRestCode(String text) async {
//   //   final res = await client.post(
//   //     '/reset-email-send',
//   //     body: {
//   //       'email': text,
//   //     },
//   //   );
//   //   throwIfNot(200, res);
//   // }
// }
