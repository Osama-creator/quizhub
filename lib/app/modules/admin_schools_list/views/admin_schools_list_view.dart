import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/admin_schools_list/controllers/admin_schools_list_controller.dart';
import 'package:quizhub/config/theme.dart';

class AdminSchoolsListView extends GetView<AdminSchoolsListController> {
  const AdminSchoolsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        title: Text(
          'المدارس',
          style: context.textTheme.headline4,
        ),
        centerTitle: true,
        backgroundColor: AppColors.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.height,
          width: context.width,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
                SchoolTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SchoolTile extends StatelessWidget {
  const SchoolTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "قاسم أمين الإعداديه",
              style:
                  context.textTheme.headline5!.copyWith(color: AppColors.light),
            ),
            Text(
              "200 طالب",
              style:
                  context.textTheme.headline5!.copyWith(color: AppColors.light),
            )
          ],
        ),
        const Divider(
          color: AppColors.light,
          endIndent: 20,
          indent: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
