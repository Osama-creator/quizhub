import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/teachers_profiles_list/controllers/teachers_profiles_list_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/views/center_loading.dart';

class TeachersProfilesListView extends GetView<TeachersProfilesListController> {
  const TeachersProfilesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachersProfilesListController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'الحسابات الغير مؤكده',
              style: TextStyle(color: AppColors.primary),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: controller.lauding
              ? const CenterLoading()
              : controller.orders.isEmpty
                  ? Center(
                      child: Text(Tr.noDataMessage.tr),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              try {
                                Get.toNamed(
                                  Routes.TEACHERS_ACCOUNT_DETAILS,
                                  arguments: controller.orders[index],
                                );
                              } catch (e, st) {
                                catchLog(e, st);
                              }
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " الاسم  :${controller.orders[index].name}",
                                    ),
                                    Text(
                                      "الماده :${controller.orders[index].material}",
                                    ),
                                    Text(
                                      "المدرسه :${controller.orders[index].school}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        );
      },
    );
  }
}
