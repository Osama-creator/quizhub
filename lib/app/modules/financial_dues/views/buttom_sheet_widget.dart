import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/financial_dues/controllers/financial_dues_controller.dart';
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
                'طلب زياده المتابعين',
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
                      hint: 'عدد المتابعين',
                      label: 'عدد المتابعين',
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
                        const Text("المبلع المدفوع"),
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
                  child: Text(
                    'إرسال',
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
                'طلب المستحقات الماليه ',
                style: context.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputField(
                hint: 'المبلغ بالجنيه المصري',
                label: 'المبلغ بالجنيه المصري',
                keyboardType: TextInputType.number,
                controller: controller.MNumberC,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputField(
                hint: 'رقم الهاتف',
                label: 'رقم الهاتف',
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
                    'إرسال',
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
