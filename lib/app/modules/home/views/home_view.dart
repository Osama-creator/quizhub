import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/home/controllers/home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () {
          controller.service.signOut();
          Get.offAndToNamed(Routes.SIGN_IN);
        },
        child: const Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
