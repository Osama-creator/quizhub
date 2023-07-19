import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/school.dart';
import 'package:quizhub/app/modules/admin_schools_list/controllers/admin_schools_list_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class AdminSchoolsListView extends GetView<AdminSchoolsListController> {
  const AdminSchoolsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminSchoolsListController>(
      init: controller,
      builder: (_) {
        return controller.lauding
            ? const CenterLoading()
            : controller.error
                ? Center(
                    child: Text(Tr.errorMessage.tr),
                  )
                : controller.schools.isEmpty
                    ? Center(
                        child: Text(Tr.noDataMessage.tr),
                      )
                    : SingleChildScrollView(
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
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.schools.length,
                              itemBuilder: (context, index) {
                                final school = controller.schools[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SchoolTile(
                                    school: school,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
      },
    );
  }
}

class SchoolTile extends StatelessWidget {
  final SchoolModel school;
  const SchoolTile({
    super.key,
    required this.school,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ADMIN_TEACHERS_OF_SCHOOL, arguments: school.name);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                school.name,
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.light, fontSize: 20),
              ),
              Text(
                " ${school.users}  ${Tr.student.tr},",
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.light),
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
      ),
    );
  }
}
