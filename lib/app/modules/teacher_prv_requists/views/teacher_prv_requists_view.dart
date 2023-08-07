import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/teacher_prv_requists/controllers/teacher_prv_requists_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class TeacherPrvRequistsView extends GetView<TeacherPrvRequistsController> {
  const TeacherPrvRequistsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Tr.previousRequests.tr)),
      body: GetBuilder<TeacherPrvRequistsController>(
        init: controller,
        builder: (_) {
          return controller.lauding
              ? const CenterLoading()
              : controller.error
                  ? Center(
                      child: Text(Tr.errorMessage.tr),
                    )
                  : controller.prevOrders.isEmpty
                      ? Center(
                          child: Text(Tr.noDataMessage.tr),
                        )
                      : ListView.builder(
                          itemCount: controller.prevOrders.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.ORDER_RESPONSE,
                                    arguments: [
                                      controller.prevOrders[index].id,
                                      controller.userId
                                      // "64bd197d8ddbd02b23d77d46",
                                      // "6494a1acd694b4d94537d2b4"
                                    ],
                                  );
                                },
                                child: Card(
                                  color: controller.prevOrders[index].confirmed
                                      ? AppColors.nextPrimary
                                      : Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${Tr.amount.tr} :   ${controller.prevOrders[index].amount} جنيه",
                                          style: context.headline5!
                                              .copyWith(fontSize: 18),
                                        ),
                                        Text(
                                          "${Tr.phoneNumber.tr}:  ${controller.prevOrders[index].phone}",
                                          style: context.headline5!
                                              .copyWith(fontSize: 18),
                                        ),
                                        Text(
                                          controller.prevOrders[index].confirmed
                                              ? "${Tr.confirmed.tr}  : ${Tr.yes.tr} "
                                              : "${Tr.confirmed.tr}  : ${Tr.no.tr} ",
                                          style: context.headline5!
                                              .copyWith(fontSize: 18),
                                        )
                                      ],
                                    ),
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
