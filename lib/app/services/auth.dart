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
    final token = (res.data as Map<String, dynamic>)['data']['token'] as String;
    await Prefs.setString('token', token);
  }

  Future<String> signUp({
    required String fName,
    required String lName,
    required String email,
    required String roleName,
    required String classS,
    String? phone,
    File? image,
    required String password,
  }) async {
    final res = await client.post(
      Endpoints.register,
      body: {
        'fName': fName,
        'lName': lName,
        'email': email,
        'password': password,
        'roleName': roleName,
        'class': classS,
        if (phone != null && phone.isNotEmpty) 'phoneNum': phone,
        if (image != null && image.path.isNotEmpty) 'image': image.path,
      },
    );
    throwIfNot(200, res);
    final userData =
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    await Prefs.setMap('auth.user', userData);
    await Prefs.setString('user_role', roleName);
    await signIn(email: email, password: password);
    return (res.data as Map)['message'] as String;
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
