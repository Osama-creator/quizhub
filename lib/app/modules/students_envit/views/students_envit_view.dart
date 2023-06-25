import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';

import 'package:quizhub/app/modules/students_envit/controllers/students_envit_controller.dart';
import 'package:quizhub/config/theme.dart';

class StudentsEnvitView extends GetView<StudentsEnvitController> {
  const StudentsEnvitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دعوه الطلاب'),
        centerTitle: true,
      ),
      body: GetBuilder<StudentsEnvitController>(
        init: controller,
        builder: (_) {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              return _buildStudentTile(context, controller.users[index]);
            },
          );
        },
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
                        child: const Text(
                          'تم',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller.enviteFriend(forwordUserId: user.id);
                        },
                        child: const Text('دعوه'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
