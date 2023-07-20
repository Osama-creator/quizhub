// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:queen/queen.dart' hide throwIfNot;
import 'package:quizhub/app/models/user_model.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/config/user_data.dart';
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

  Future<String?> signIn({
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
    final responseData = res.data;
    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'] as String?;
      if (message != null) {
        final userData = responseData['userExist'] as Map<String, dynamic>?;

        if (userData != null) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth.user', json.encode(userData));
        }
        return message;
      }
    }
    throw Exception('Invalid response data');
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String roleName,
    required String school,
    required String erea,
    required String governorate,
    required String password,
    required String confPassword,
    String? classS,
    String? subject,
    String? phone,
    File? image,
  }) async {
    final res = await client.post(
      Endpoints.register,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'confirm_Password': confPassword,
        'role': roleName,
        'school': school,
        'Area': erea,
        'governorate': governorate,
        if (classS != null && classS.isNotEmpty) 'the_line': classS,
        if (subject != null && subject.isNotEmpty) 'material': subject,
        if (phone != null && phone.isNotEmpty) 'phone': phone,
        if (image != null && image.path.isNotEmpty) 'img': image.path,
      },
    );
    throwIfNot(200, res);
    signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    await Prefs.remove('auth.user');
    UserData.clearUserData();
    Get.offAndToNamed(Routes.SIGN_IN);
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
