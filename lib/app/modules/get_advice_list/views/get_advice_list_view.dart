import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/get_advice_list/controllers/get_advice_list_controller.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class GetAdviceListView extends GetView<GetAdviceListController> {
  const GetAdviceListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.advices.tr),
        centerTitle: true,
      ),
      body: GetBuilder<GetAdviceListController>(
        init: controller,
        builder: (_) {
          return controller.lauding
              ? const CenterLoading()
              : controller.advices.isEmpty
                  ? Center(child: Text(Tr.noDataAvailable.tr))
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
