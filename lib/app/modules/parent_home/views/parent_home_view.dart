import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/parent_home/controllers/parent_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class ParentHomeView extends GetView<ParentHomeController> {
  const ParentHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'م/ خالد شلقامي',
          style: context.textTheme.headline6,
        ),
        centerTitle: false,
        backgroundColor: AppColors.light,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(Asset.images.teacher),
            backgroundColor: Colors.transparent,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ولي أمر',
              style: context.textTheme.headline6!.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        ],
        elevation: 3,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              'الطلاب الذين تتابعهم',
              style: context.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const StudentsListTile(),
          const StudentsListTile(),
          const StudentsListTile(),
          const StudentsListTile(),
          const StudentsListTile(),
          const StudentsListTile()
        ],
      ),
    );
  }
}

class StudentsListTile extends StatelessWidget {
  const StudentsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.STUDENT_OVERVIEW);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
                'الصف الثالث ',
                style: context.textTheme.headline6!
                    .copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}