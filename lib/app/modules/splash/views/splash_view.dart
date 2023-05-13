import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/splash/controllers/splash_controller.dart';
import 'package:quizhub/generated/assets.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Asset.images.logo,
          height: context.height * 0.5,
          width: context.width * 0.5,
        ),
      ),
    );
  }
}
