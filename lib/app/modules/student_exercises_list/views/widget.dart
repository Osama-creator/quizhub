import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/student_exercises_list/controllers/student_exercises_list_controller.dart';
import 'package:quizhub/config/theme.dart';

Widget buildSearchBar(
  BuildContext context,
  StudentExercisesListController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: TextField(
      onChanged: (query) {
        controller.setSearchQuery(query);
      },
      decoration: InputDecoration(
        hintText: "Search exams",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget buildTechersList(
  BuildContext context,
  StudentExercisesListController controller,
) {
  return SizedBox(
    height: context.height * 0.09,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.teachers.length,
      itemBuilder: (context, index) {
        final teacher = controller.teachers[index];
        return GestureDetector(
          onTap: () {
            controller.onSelect(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: controller.selectedTeacher == teacher
                  ? AppColors.primary
                  : AppColors.nextPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      teacher.profilePic.isEmpty
                          ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                          : teacher.profilePic,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      " ا /${teacher.name}",
                      style: context.textTheme.titleLarge!.copyWith(
                        color: controller.selectedTeacher == teacher
                            ? AppColors.light
                            : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
