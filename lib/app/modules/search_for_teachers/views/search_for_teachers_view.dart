import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/modules/search_for_teachers/controllers/search_for_teachers_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

class SearchForTeachersView extends GetView<SearchForTeachersController> {
  SearchForTeachersView({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchForTeachersController>(
      init: controller,
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) => controller.filterUsers(value),
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GetBuilder<SearchForTeachersController>(
                    init: controller,
                    builder: (_) {
                      return ListView.builder(
                        itemCount: controller.filteredTeachers.length,
                        itemBuilder: (context, index) {
                          final user = controller.filteredTeachers[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SearchTeacherListTile(
                              teacher: user,
                              controller: controller,
                            ),
                          );
                        },
                      );
                    },
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

class SearchTeacherListTile extends StatelessWidget {
  final Teacher teacher;
  final SearchForTeachersController controller;
  const SearchTeacherListTile({
    super.key,
    required this.teacher,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAndToNamed(Routes.HOME, arguments: teacher.id);
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
                backgroundImage: NetworkImage(
                  teacher.profilePic.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : teacher.profilePic,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              teacher.name,
              style: context.textTheme.headline6!.copyWith(fontSize: 18),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                teacher.subj,
                style: context.textTheme.headline6!
                    .copyWith(fontSize: 18, color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
