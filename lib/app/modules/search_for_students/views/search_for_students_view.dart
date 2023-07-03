import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/modules/search_for_students/controllers/search_for_students_controller.dart';
import 'package:quizhub/config/theme.dart';

class SearchForStudentsView extends GetView<SearchForStudentsController> {
  SearchForStudentsView({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchForStudentsController>(
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
                  child: GetBuilder<SearchForStudentsController>(
                    init: controller,
                    builder: (_) {
                      return ListView.builder(
                        itemCount: controller.filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = controller.filteredUsers[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SearchStudentsListTile(
                              student: user,
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

class SearchStudentsListTile extends StatelessWidget {
  final User student;
  final SearchForStudentsController controller;
  const SearchStudentsListTile({
    super.key,
    required this.student,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  student.profilePic.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : student.profilePic,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              student.name,
              style: context.textTheme.headline6!.copyWith(fontSize: 18),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: context.width * 0.22,
                height: context.height * 0.055,
                child: student.invited!
                    ? OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: const Text(
                          'تم',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller.folowStudent(forwordUserId: student.id);
                        },
                        child: const Text('متابعه'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
