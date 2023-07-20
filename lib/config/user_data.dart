// ignore_for_file: avoid_classes_with_only_static_members, prefer_final_locals, depend_on_referenced_packages
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class UserData {
  static String? _userId;
  static String? _name;
  static String? _email;
  static String? _phone;
  static String? _userRole;
  static String? _userSchool;

  static Future<void> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('auth.user');
    if (userDataJson != null) {
      Map<String, dynamic> userData =
          json.decode(userDataJson) as Map<String, dynamic>;
      _userId = userData['_id'] as String?;
      _name = userData['name'] as String?;
      _email = userData['email'] as String?;
      _phone = userData['phone'] as String?;
      _userRole = userData['role'] as String?;
      _userSchool = userData['school'] as String?;
    }
  }

  static String? get userId => _userId;
  static String? get name => _name;
  static String? get email => _email;
  static String? get phone => _phone;
  static String? get userRole => _userRole;
  static String? get userSchool => _userSchool;

  static void clearUserData() {
    _userId = null;
    _name = null;
    _email = null;
    _phone = null;
    _userRole = null;
    _userSchool = null;
  }
}
