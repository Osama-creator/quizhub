import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/admin_teachers_of_school/controllers/admin_teachers_of_school_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';

class AdminTeachersOfSchoolView
    extends GetView<AdminTeachersOfSchoolController> {
  const AdminTeachersOfSchoolView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مدرسه اديب وهبه'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ListTileCust2(),
            ListTileCust2(),
            ListTileCust2(),
            ListTileCust2(),
            ListTileCust2(),
            ListTileCust2(),
          ],
        ),
      ),
    );
  }
}

class ListTileCust2 extends StatelessWidget {
  const ListTileCust2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.ADMIN_TEACHER_SUMMERY);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.nextPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          height: context.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(Asset.images.teacher),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(
                'أحمد سيد',
                style: context.textTheme.headline6,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'مدرس  :رياضيات',
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
