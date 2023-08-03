// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:queen/queen.dart' hide throwIfNot;
import 'package:quizhub/app/models/user_model.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class AuthService {
  final ApiClient client;
  AuthService(
    this.client,
  );

  bool get isLoggedIn => Prefs.getString('token').isNotEmpty;

  bool get isLoggedOut => !isLoggedIn;

  Future<UserModel?> get cachedUser async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('auth.user');
    if (userString == null) return null;
    final user = await jsonDecode(userString) as Map<String, dynamic>;
    return UserModel.fromMap(user);
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
      if (message == "Done") {
        final userData = responseData['userExist'] as Map<String, dynamic>?;
        if (userData != null) {
          prefs.setString('auth.user', jsonEncode(userData));
          navigateToProperPage();
        }
        return message;
      }
    }
    throw Exception('Invalid response data');
  }

  Future<void> navigateToProperPage() async {
    final userData = await cachedUser;
    log(userData!.name);
    log(userData.roleName);
    if (userData.roleName == "Teacher") {
      Get.offAllNamed(Routes.TEACHER_HOME, arguments: userData.id);
    } else if (userData.roleName == "Parent") {
      Get.offAllNamed(Routes.PARENT_HOME, arguments: userData.id);
    } else if (userData.roleName == "Student") {
      Get.offAllNamed(Routes.STUDENT_HOME, arguments: userData.id);
    } else {
      Get.offAllNamed(
        Routes.ADMIN_HOME,
      );
    }
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
    final formData = FormData();
    formData.fields.addAll([
      MapEntry('name', name),
      MapEntry('email', email),
      MapEntry('password', password),
      MapEntry('confirm_Password', confPassword),
      MapEntry('role', roleName),
      MapEntry('school', school),
      MapEntry('governorate', governorate),
      MapEntry('Area', erea),
      if (classS != null && classS.isNotEmpty) MapEntry('the_grades', classS),
      if (subject != null && subject.isNotEmpty) MapEntry('material', subject),
      if (phone != null && phone.isNotEmpty) MapEntry('phone', phone),
    ]);
    if (image != null && image.path.isNotEmpty) {
      final String fileName = image.path.split('/').last;
      String? mimeType = mime(fileName);
      final String mimee = mimeType!.split('/')[0];
      final String type = mimeType.split('/')[1];
      formData.files.add(
        MapEntry(
          'img',
          await MultipartFile.fromFile(
            image.path,
            filename: fileName,
            contentType: MediaType(mimee, type),
          ),
        ),
      );
    }
    final res = await client.post(
      Endpoints.register,
      body: formData,
      contentType: 'multipart/form-data',
    );
    throwIfNot(200, res);
    signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = await cachedUser;
    final res = await client.post(
      Endpoints.signOut,
      body: {"id": userData!.id},
    );
    throwIfNot(200, res);
    prefs.remove('auth.user');

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
