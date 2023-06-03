import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/admin_teacher_summery/controllers/admin_teacher_summery_controller.dart';

import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';

class AdminTeacherSummeryView extends GetView<AdminTeacherSummeryController> {
  const AdminTeacherSummeryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
              style: context.textTheme.headline6!
                  .copyWith(color: AppColors.light, fontSize: 18),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'مدرس  :رياضيات',
                style: context.textTheme.headline6!
                    .copyWith(color: AppColors.light, fontSize: 18),
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'اخر المعاملات',
              style: context.textTheme.headline6!.copyWith(
                color: AppColors.black,
              ),
            ),
            const ListTileCust3(),
            const ListTileCust3(),
            const ListTileCust3(),
          ],
        ),
      ),
    );
  }
}

class ListTileCust3 extends StatelessWidget {
  const ListTileCust3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.nextPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        height: context.height * 0.13,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '10 / 1 / 2022',
                    style: context.textTheme.headline6,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '250 جنيه',
                      style: context.textTheme.headline6!
                          .copyWith(color: AppColors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'رقم التحويل',
                    style: context.textTheme.headline6!
                        .copyWith(color: AppColors.black, fontSize: 18),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '2523',
                      style: context.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
