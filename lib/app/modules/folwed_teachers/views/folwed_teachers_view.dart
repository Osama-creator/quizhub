import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/folwed_teachers/controllers/folwed_teachers_controller.dart';
import 'package:quizhub/app/modules/folwed_teachers/views/widget.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class FolwedTeachersView extends GetView<FolwedTeachersController> {
  const FolwedTeachersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FolwedTeachersController>(
      init: controller,
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Text(
                    Tr.teachersYouFollow.tr,
                    style: context.textTheme.headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                if (controller.loading)
                  CenterLoading()
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.teachers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TeachersListTile(
                            controller: controller,
                            teacher: controller.teachers[index],
                          ),
                        );
                      },
                    ),
                  ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SEARCH_FOR_TEACHERS);
                  },
                  child: Center(
                    child: Text(
                      Tr.searchTeachers.tr,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
