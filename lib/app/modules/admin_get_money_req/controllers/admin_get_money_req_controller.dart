import 'dart:io';

import 'package:get/get.dart';
import 'package:quizhub/helper/pick.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminGetMoneyReqController extends GetxController {
  String imageString = "";
  late bool imageUploaded;
  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      update();
    }
  }

  Future<void> makePhoneCall({
    required String phoneNumber,
    required String money,
  }) async {
    final Uri url = Uri(scheme: 'tel', path: "*9*7*01004858198*5#");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
