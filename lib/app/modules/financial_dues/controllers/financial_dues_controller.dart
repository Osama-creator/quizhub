import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/financials_model.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:url_launcher/url_launcher.dart';

class FinancialDuesController extends GetxController {
  final fNumberC = TextEditingController();
  final MNumberC = TextEditingController();
  final PhoneNumberC = TextEditingController();
  final fnumberText = ''.obs;

  final service = Get.find<FinancialsService>();
  FinancialsModel? data;
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

  Future<void> makePhoneCall({
    required String phoneNumber,
    required String money,
  }) async {
    final Uri url = Uri(scheme: 'tel', path: "*9*7*$phoneNumber*$money#");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
