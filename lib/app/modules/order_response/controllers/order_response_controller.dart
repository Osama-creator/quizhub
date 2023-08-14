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
  bool loading = false;
  OrderResponse res = OrderResponse(title: "title", profilePic: "pic");
  @override
  Future<void> onInit() async {
    orderId = args[0];
    teacherId = args[1];
    try {
      loading = true;
      update();
      res = await service.fetchOrderResponse(
        orderId: orderId,
        teacherId: teacherId,
      );
      log(res.profilePic);
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }

    super.onInit();
  }
}
