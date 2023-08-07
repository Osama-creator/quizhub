import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/student_overview/controllers/student_overview_controller.dart';
import 'package:quizhub/app/modules/student_overview/views/wedget.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

class StudentOverviewView extends GetView<StudentOverviewController> {
  const StudentOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Tr.studentPageTitle.tr),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  maxRadius: 75,
                  backgroundImage: NetworkImage(
                    controller.studentData.profilePic.isEmpty
                        ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                        : controller.studentData.profilePic,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(
                controller.studentData.name,
                style: context.textTheme.headlineMedium!.copyWith(
                  color: AppColors.black,
                ),
              ),
              GetBuilder<StudentOverviewController>(
                init: controller,
                builder: (_) {
                  return SubjectTile(controller: controller);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
