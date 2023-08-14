import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/financial_dues/controllers/financial_dues_controller.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/input_feild.dart';

void addFolowersButtomsheet(
  BuildContext context,
  FinancialDuesController controller,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext bc) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                Tr.addFollowersRequest.tr,
                style: context.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: InputField(
                      hint: Tr.followersCount.tr,
                      label: Tr.followersCount.tr,
                      keyboardType: TextInputType.number,
                      controller: controller.fNumberC,
                      onChanged: (val) {
                        controller.fnumberText.value = val;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        Text(Tr.amountInEgp.tr),
                        Obx(() {
                          return Text("${controller.fnumberText.value} ج.م");
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: context.height * 0.05,
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.onAddFolSubmit();
                    Navigator.pop(context);
                  },
                  child: controller.isLoading
                      ? const CenterLoading()
                      : Text(
                          Tr.send.tr,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void askForMoneyButtomsheet(
  BuildContext context,
  FinancialDuesController controller,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext bc) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                Tr.requestFinancialDues.tr,
                style: context.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputField(
                hint: Tr.amountInEgp.tr,
                label: Tr.amountInEgp.tr,
                keyboardType: TextInputType.number,
                controller: controller.MNumberC,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputField(
                hint: Tr.phoneHint.tr,
                label: Tr.phoneHint.tr,
                keyboardType: TextInputType.phone,
                controller: controller.PhoneNumberC,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: context.height * 0.05,
                width: context.width,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.orderTeacher();
                    controller.MNumberC.clear();
                    controller.PhoneNumberC.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: Text(
                    Tr.send.tr,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
