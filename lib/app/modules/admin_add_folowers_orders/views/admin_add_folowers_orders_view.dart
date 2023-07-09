import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/admin_add_folowers_orders/controllers/admin_add_folowers_orders_controller.dart';

class AdminAddFolowersOrdersView
    extends GetView<AdminAddFolowersOrdersController> {
  const AdminAddFolowersOrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلبات زيادة المتابعين'),
        centerTitle: true,
      ),
      body: GetBuilder<AdminAddFolowersOrdersController>(
        init: controller,
        builder: (_) {
          return ListView.builder(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "المدرس : ${controller.teachers[index].name}",
                              style: context.headline6,
                            ),
                            Column(
                              children: [
                                const Text(
                                  " عدد المتابعين المطلوب زيادتها ",
                                ),
                                Text(
                                  controller.teachers[index].confirm.toString(),
                                  style: context.headline6,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await controller.cofirm(
                                  "confirm",
                                  controller.teachers[index].id,
                                );
                              },
                              child: const Text("confirm"),
                            ),
                            OutlinedButton(
                              onPressed: () async {
                                await controller.cofirm(
                                  "decline",
                                  controller.teachers[index].id,
                                );
                              },
                              child: const Text("cancel"),
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
