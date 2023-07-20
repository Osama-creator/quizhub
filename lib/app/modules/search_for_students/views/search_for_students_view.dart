import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/search_for_students/controllers/search_for_students_controller.dart';
import 'package:quizhub/app/modules/search_for_students/views/widget.dart';
import 'package:quizhub/views/center_loading.dart';

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
                      return controller.lauding
                          ? const CenterLoading()
                          : controller.students.isEmpty
                              ? const Center(
                                  child: Text("لا يوجد بيانات"),
                                )
                              : ListView.builder(
                                  itemCount: controller.filteredUsers.length,
                                  itemBuilder: (context, index) {
                                    final user =
                                        controller.filteredUsers[index];
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
