import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/views/input_feild.dart';

class FinancialDuesController extends GetxController {
  final fNumberC = TextEditingController();

  final service = Get.find<FinancialsService>();

  Future<void> onAddFolSubmit() async {
    await service.addFolowersToTeacher(
      teacherId: "6494a1acd694b4d94537d2b4",
      folowersNumber: fNumberC.text,
    );
    Alert.success("تم ارسال الطلب بنجاح");
  }

  void addFolowers(
    BuildContext context,
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
                        controller: fNumberC,
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          Text("المبلع المدفوع"),
                          Text("100 ج.م"),
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
                      onAddFolSubmit();
                      fNumberC.clear();
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
}
