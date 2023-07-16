import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/admin_add_folowers_orders/controllers/admin_add_folowers_orders_controller.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class AdminAddFolowersOrdersView
    extends GetView<AdminAddFolowersOrdersController> {
  const AdminAddFolowersOrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.dminNewFolowersOreders.tr),
        centerTitle: true,
      ),
      body: GetBuilder<AdminAddFolowersOrdersController>(
        init: controller,
        builder: (_) {
          return controller.lauding
              ? const CenterLoading()
              : controller.error
                  ? Center(
                      child: Text(Tr.errorMessage.tr),
                    )
                  : controller.teachers.isEmpty
                      ? Center(
                          child: Text(Tr.noDataMessage.tr),
                        )
                      : ListView.builder(
                          itemCount: controller.teachers.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${Tr.teacherLabel.tr} : ${controller.teachers[index].name}",
                                            style: context.headline6,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                Tr.followersLabel.tr,
                                              ),
                                              Text(
                                                controller
                                                    .teachers[index].confirm
                                                    .toString(),
                                                style: context.headline6,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              await controller.confirm(
                                                "confirm",
                                                controller.teachers[index].id,
                                              );
                                            },
                                            child: Text(Tr.confirm.tr),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {
                                              await controller.confirm(
                                                "decline",
                                                controller.teachers[index].id,
                                              );
                                            },
                                            child: Text(Tr.cancel.tr),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
        },
      ),
    );
  }
}
