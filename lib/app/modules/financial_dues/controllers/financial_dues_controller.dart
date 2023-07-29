import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/financials_model.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class FinancialDuesController extends GetxController {
  final fNumberC = TextEditingController();
  final MNumberC = TextEditingController();
  final PhoneNumberC = TextEditingController();
  final fnumberText = ''.obs;
  bool isLoading = false;
  bool error = false;

  final service = Get.find<FinancialsService>();
  final authService = Get.find<AuthService>();

  FinancialsModel? data = FinancialsModel(
    equation: 0,
    followLength: 0,
    name: "teacher name",
    result: 0,
  );

  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;

    if (userData!.id != null) {
      try {
        data = await service.getfinancialsData(teacherId: userData.id!);
      } catch (e, st) {
        catchLog(e, st);
      }
    } else {
      log("err in id");
    }

    update();
    super.onInit();
  }

  Future<void> onAddFolSubmit() async {
    final userData = await authService.cachedUser;
    if (data!.equation >= int.parse(fNumberC.text)) {
      if (userData!.id != null) {
        try {
          await service.addFolowersToTeacher(
            teacherId: userData.id!,
            folowersNumber: fNumberC.text,
          );
        } catch (e, st) {
          catchLog(e, st);
        }
      } else {
        log("err in id");
      }
      Alert.success("تم ارسال الطلب بنجاح");
    } else {
      Alert.error("لا يوجد رصيد كافي لزياده المتابعين");
      fNumberC.clear();
    }
  }

  Future<void> orderTeacher() async {
    final userData = await authService.cachedUser;
    if (userData!.id != null) {
      try {
        isLoading = true;
        if (data!.equation > 100) {
          await service.orderForMoney(
            teacherId: userData.id!,
            phone: int.parse(PhoneNumberC.text),
            amount: int.parse(MNumberC.text),
          );
          Alert.success("تم ارسال الطلب بنجاح");
        } else {
          Alert.error("لا يوجد رصيد كافي ");
        }
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        isLoading = false;
        update();
      }
    } else {
      log("err in id");
    }
  }
}
