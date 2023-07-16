// ignore_for_file: parameter_assignments

import 'dart:developer';

import 'package:get/get.dart';

void catchLog(Object e, StackTrace st) {
  log('[error] => $e');
  log('[error stack trace] => $st');
}

class ActionHandel extends GetxController {
  Future<void> performAction(
    Future<void> Function() action,
    // ignore: avoid_positional_boolean_parameters
    bool lauding,
    bool error,
  ) async {
    try {
      lauding = true;
      update();
      await action();
    } catch (e) {
      log(e.toString());
      error = true;
    } finally {
      lauding = false;
      update();
    }
  }
}
