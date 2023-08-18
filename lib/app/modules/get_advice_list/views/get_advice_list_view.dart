import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/get_advice_list/controllers/get_advice_list_controller.dart';
import 'package:quizhub/views/center_loading.dart';

class GetAdviceListView extends GetView<GetAdviceListController> {
  const GetAdviceListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النصائح'),
        centerTitle: true,
      ),
      body: GetBuilder<GetAdviceListController>(
        init: controller,
        builder: (_) {
          return controller.lauding
              ? const CenterLoading()
              : controller.advices.isEmpty
                  ? const Center(child: Text("لا يوحد بيانات"))
                  : ListView.builder(
                      itemCount: controller.advices.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(controller.advices[index].title),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.advices[index].body),
                                ),
                              ],
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
