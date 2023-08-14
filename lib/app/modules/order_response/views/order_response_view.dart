import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/order_response/controllers/order_response_controller.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class OrderResponseView extends GetView<OrderResponseController> {
  const OrderResponseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Tr.confirmationDetails.tr,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<OrderResponseController>(
        init: controller,
        builder: (_) {
          return controller.loading
              ? const CenterLoading()
              : Column(
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
