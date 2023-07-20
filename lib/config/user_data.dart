// ignore_for_file: avoid_classes_with_only_static_members

import 'package:queen/queen.dart';

abstract class UserData {
  static Map<String, dynamic>? _userDataMap;
  static Future<Map<String, dynamic>?> get userData async {
    _userDataMap ??= Prefs.getMap('auth.user');
    return _userDataMap;
  }

  static String? get userId => _userDataMap?['_id'] as String?;
  static String? get name => _userDataMap?['name'] as String?;
  static String? get email => _userDataMap?['email'] as String?;
  static String? get phone => _userDataMap?['phone'] as String?;
  static String? get userRole => _userDataMap?['role'] as String?;
  static String? get userSchool => _userDataMap?['school'] as String?;
  static void clearUserData() {
    _userDataMap = null;
  }
}
