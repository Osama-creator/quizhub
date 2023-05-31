import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإداره',
          style: context.textTheme.headline6,
        ),
        centerTitle: false,
        backgroundColor: AppColors.light,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'الطلبات الماليه',
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
        children: const [
          ListTileCust(),
          ListTileCust(),
          ListTileCust(),
          ListTileCust(),
          ListTileCust(),
          ListTileCust(),
        ],
      ),
    );
  }
}

class ListTileCust extends StatelessWidget {
  const ListTileCust({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                '200 ج',
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
