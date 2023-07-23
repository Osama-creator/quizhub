import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/teacher_prv_requists/controllers/teacher_prv_requists_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class TeacherPrvRequistsView extends GetView<TeacherPrvRequistsController> {
  const TeacherPrvRequistsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الطلبات السابقه")),
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
                              child: Card(
                                color: controller.prevOrders[index].confirmed
                                    ? AppColors.next2Primary
                                    : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "المبلغ :   ${controller.prevOrders[index].amount} جنيه",
                                        style: context.headline5!
                                            .copyWith(fontSize: 18),
                                      ),
                                      Text(
                                        "رقم الهاتق :  ${controller.prevOrders[index].phone}",
                                        style: context.headline5!
                                            .copyWith(fontSize: 18),
                                      ),
                                      Text(
                                        controller.prevOrders[index].confirmed
                                            ? "تم التأكيد : نعم "
                                            : "تم التأكيد : لا ",
                                        style: context.headline5!
                                            .copyWith(fontSize: 18),
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
