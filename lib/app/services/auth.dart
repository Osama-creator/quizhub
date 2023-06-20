// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:queen/queen.dart' hide throwIfNot;
import 'package:quizhub/app/models/user_model.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class AuthService {
  final ApiClient client;
  AuthService(
    this.client,
  );

  bool get isLoggedIn => Prefs.getString('token').isNotEmpty;

  bool get isLoggedOut => !isLoggedIn;

  UserModel? get cachedUser {
    final user = Prefs.getMap('auth.user');
    if (user.isEmpty) return null;
    return UserModel.fromMap(user);
  }

  UserModel get user => cachedUser ?? (throw 'user is not logged in !');

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final res = await client.post(
      Endpoints.login,
      body: {
        'email': email,
        'password': password,
      },
    );
    throwIfNot(200, res);
    // save the token to shared preferences
    // ignore: avoid_dynamic_calls
  }

  Future<String> signUp({
    required String name,
    required String email,
    required String roleName,
    required String classS,
    required String school,
    required String erea,
    required String governorate,
    String? phone,
    File? image,
    required String password,
    required String confPassword,
  }) async {
    final res = await client.post(
      Endpoints.register,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'confirm_Password': confPassword,
        'role': roleName,
        'the_line': classS,
        'school': school,
        'Area': erea,
        'governorate': governorate,
        if (phone != null && phone.isNotEmpty) 'phone': phone,
        if (image != null && image.path.isNotEmpty) 'img': image.path,
      },
    );
    throwIfNot(200, res);

    final responseData = res.data;
    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'] as String?;
      if (message != null) {
        final userData = responseData['date'] as Map<String, dynamic>?;
        if (userData != null) {
          await Prefs.setMap('auth.user', userData);
        }
        await Prefs.setString('role', roleName);
        return message;
      }
    }

    throw Exception('Invalid response data');
  }

  Future<void> signOut() async {
    await Prefs.removeMany(['token', 'auth.user']);
    // client.get('/logout');
  }

  @override
  String toString() => 'AuthService(client: $client)';

  @override
  bool operator ==(covariant AuthService other) {
    if (identical(this, other)) return true;

    return other.client == client;
  }

  @override
  int get hashCode => client.hashCode;
}
