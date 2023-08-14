import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/modules/students_envit/controllers/students_envit_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class StudentsEnvitView extends GetView<StudentsEnvitController> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.friendsInvitations.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) => controller.filterUsers(value),
              decoration: InputDecoration(
                labelText: Tr.search.tr,
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
            child: GetBuilder<StudentsEnvitController>(
              init: controller,
              builder: (_) {
                return controller.loading
                    ? const CenterLoading()
                    : ListView.builder(
                        itemCount: controller.filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = controller.filteredUsers[index];
                          return _buildStudentTile(context, user);
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildStudentTile(BuildContext context, User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.nextPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(
                  user.profilePic.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : user.profilePic,
                ),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 10),
              Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: context.width * 0.22,
                height: context.height * 0.055,
                child: user.invited!
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
                        child: Text(
                          Tr.done.tr,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller.enviteFriend(forwordUserId: user.id);
                        },
                        child: Text(
                          Tr.invite.tr,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
