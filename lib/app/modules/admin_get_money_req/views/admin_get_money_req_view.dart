import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/admin_get_money_req/controllers/admin_get_money_req_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/money_conf_b_sheet.dart';

class AdminGetMoneyReqView extends GetView<AdminGetMoneyReqController> {
  const AdminGetMoneyReqView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.dminNewFolowersOreders.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: InkWell(
          onTap: () {
            controller.makePhoneCall(
              phoneNumber: "phoneNumber",
              money: "money",
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.nextPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            height: context.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg",
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Text(
                        "استاذ احمد هلال ",
                        style: context.textTheme.titleLarge,
                      ),
                      const Spacer()
                    ],
                  ),
                  Text(
                    "الرقم : 01004858198",
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    "المبلغ : 5 جنيه",
                    style: context.textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () => confirmMoneyOrder(context, controller),
                    child: const Text("تأكيد"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
