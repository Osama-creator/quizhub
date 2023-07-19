import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/admin_get_money_req/controllers/admin_get_money_req_controller.dart';
import 'package:quizhub/app/modules/admin_get_money_req/views/widget.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class AdminGetMoneyReqView extends GetView<AdminGetMoneyReqController> {
  const AdminGetMoneyReqView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminGetMoneyReqController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Tr.moneyRequists.tr),
            centerTitle: true,
          ),
          body: controller.lauding
              ? const CenterLoading()
              : controller.error
                  ? Center(
                      child: Text(Tr.errorMessage.tr),
                    )
                  : controller.orders.isEmpty
                      ? Center(
                          child: Text(Tr.noDataMessage.tr),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ListView.builder(
                            itemCount: controller.orders.length,
                            itemBuilder: (context, index) {
                              return OrderTile(
                                controller: controller,
                                order: controller.orders[index],
                                index: index,
                              );
                            },
                          ),
                        ),
        );
      },
    );
  }
}
