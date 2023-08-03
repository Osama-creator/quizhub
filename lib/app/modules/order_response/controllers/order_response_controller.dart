import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_prv_requist.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/helper/func.dart';

class OrderResponseController extends GetxController {
  final args = Get.arguments as List<String>;
  final service = Get.find<AdminService>();
  String orderId = "";
  String teacherId = "";
  OrderResponse res = OrderResponse(title: "title", profilePic: "pic");
  @override
  Future<void> onInit() async {
    orderId = args[0];
    teacherId = args[1];
    try {
      res = await service.fetchOrderResponse(
        orderId: orderId,
        teacherId: teacherId,
      );
      log(res.profilePic);
      update();
    } catch (e, st) {
      catchLog(e, st);
    }
    update();
    super.onInit();
  }
}
