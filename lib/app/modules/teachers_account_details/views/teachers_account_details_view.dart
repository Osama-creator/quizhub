import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/teachers_account_details/controllers/teachers_account_details_controller.dart';
import 'package:quizhub/views/center_loading.dart';

class TeachersAccountDetailsView
    extends GetView<TeachersAccountDetailsController> {
  const TeachersAccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المعلم'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 85,
                backgroundImage: NetworkImage(
                  controller.account!.image.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : controller.account!.image,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('الاسم'),
                subtitle: Text(controller.account!.name),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('الماده'),
                subtitle: Text(controller.account!.material),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('المدرسة'),
                subtitle: Text(controller.account!.school),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('المحافظة'),
                subtitle: Text(controller.account!.governorate),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('الهاتف'),
                subtitle: Text(controller.account!.phone),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<TeachersAccountDetailsController>(
              init: controller,
              builder: (_) {
                return SizedBox(
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.confirmAccount();
                    },
                    child: controller.lauding
                        ? const CenterLoading()
                        : const Text("تأكيد"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
