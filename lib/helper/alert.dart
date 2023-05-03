import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/generated/tr.dart';

// ignore: avoid_classes_with_only_static_members
abstract class Alert {
  /// * show success alert
  static void success(Object msg, {String desc = ''}) {
    Get.snackbar(
      msg.toString(),
      desc,
      backgroundColor: Colors.yellow,
    );
  }

  /// * show error alert
  static void error(Object e, {String desc = ''}) {
    Get.snackbar(
      e.toString(),
      desc,
      backgroundColor: Colors.red,
    );
  }

  /// * show error alert
  static void notValidForm() {
    return error(Tr.notValidForm.tr);
  }
}
