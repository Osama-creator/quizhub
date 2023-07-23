import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/financials_model.dart';
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
  FinancialsModel? data = FinancialsModel(
    equation: 0,
    followLength: 0,
    name: "teacher name",
    result: 0,
  );
  @override
  Future<void> onInit() async {
    data =
        await service.getfinancialsData(teacherId: "6494a1acd694b4d94537d2b4");

    update();
    super.onInit();
  }

  Future<void> onAddFolSubmit() async {
    if (data!.equation >= int.parse(fNumberC.text)) {
      await service.addFolowersToTeacher(
        teacherId: "6494a1acd694b4d94537d2b4",
        folowersNumber: fNumberC.text,
      );
      Alert.success("تم ارسال الطلب بنجاح");
    } else {
      Alert.error("لا يوجد رصيد كافي لزياده المتابعين");
    }
  }

  Future<void> orderTeacher() async {
    try {
      isLoading = true;
      await service.orderForMoney(
        teacherId: "6494a1acd694b4d94537d2b4",
        phone: int.parse(PhoneNumberC.text),
        amount: int.parse(MNumberC.text),
      );
      Alert.success("تم ارسال الطلب بنجاح");
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      isLoading = false;
      update();
    }
  }
}
