import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/order_response/controllers/order_response_controller.dart';

class OrderResponseView extends GetView<OrderResponseController> {
  const OrderResponseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل التأكيد'),
        centerTitle: true,
      ),
      body: GetBuilder<OrderResponseController>(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              if (controller.res.title.isNotEmpty) ...[
                Text(controller.res.title)
              ],
              SizedBox(
                height: context.height * 0.6,
                width: context.width,
                child: Image.network(
                  controller.res.profilePic,
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
