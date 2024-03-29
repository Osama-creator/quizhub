import 'dart:io';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/money_order.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pick.dart';

class AdminGetMoneyReqController extends GetxController {
  final service = Get.find<AdminService>();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  List<MoneyOrder> orders = [];
  @override
  Future<void> onInit() async {
    try {
      lauding = true;
      update();
      orders = await service.getMoneyOrders();
    } finally {
      lauding = false;
      update();
    }

    super.onInit();
  }

  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      update();
    }
  }

  Future<void> confirmOrder({
    required String id,
    required File img,
    String? title,
  }) async {
    try {
      lauding = true;
      update();
      await service.confirmMoneyOrder(idOrder: id, img: img, title: title);
    } finally {
      lauding = false;
      update();
    }

    Alert.success(Tr.confirmed.tr);
  }

  Future<void> makePhoneCall({
    required int index,
  }) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: "*9*7*${orders[index].phone}*${orders[index].amount}#",
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
