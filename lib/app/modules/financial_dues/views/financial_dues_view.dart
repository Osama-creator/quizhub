import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/financial_dues/controllers/financial_dues_controller.dart';
import 'package:quizhub/app/modules/financial_dues/views/buttom_sheet_widget.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class FinancialDuesView extends GetView<FinancialDuesController> {
  const FinancialDuesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.financialDues.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<FinancialDuesController>(
        init: controller,
        builder: (_) {
          return controller.isLoading
              ? const CenterLoading()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Tr.views.tr,
                            style: context.textTheme.titleLarge!
                                .copyWith(color: AppColors.black),
                          ),
                          Text(
                            controller.data!.result.toString(),
                            style: context.textTheme.titleLarge!
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Tr.folCount.tr,
                            style: context.textTheme.titleLarge!
                                .copyWith(color: AppColors.black),
                          ),
                          Text(
                            controller.data!.followLength.toString(),
                            style: context.textTheme.titleLarge!
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Tr.finant.tr,
                            style: context.textTheme.titleLarge!
                                .copyWith(color: AppColors.black),
                          ),
                          Text(
                            "${controller.data!.equation * 200}  جنيه",
                            style: context.textTheme.titleLarge!.copyWith(
                              color: controller.data!.equation == 100
                                  ? AppColors.black
                                  : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.2,
                      ),
                      SizedBox(
                        height: context.height * 0.06,
                        width: context.width,
                        child: ElevatedButton(
                          onPressed: () {
                            addFolowersButtomsheet(context, controller);
                          },
                          child: Text(
                            Tr.orderIncFol.tr,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: context.height * 0.06,
                        width: context.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            askForMoneyButtomsheet(context, controller);
                          },
                          child: Text(
                            Tr.getMoney.tr,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => Get.toNamed(
                          Routes.TEACHER_PRV_REQUISTS,
                          arguments: controller.teacherId,
                        ),
                        child: Text(
                          Tr.prevOrders.tr,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
