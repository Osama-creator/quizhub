import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/student_overview/controllers/student_overview_controller.dart';
import 'package:quizhub/config/theme.dart';

class StudentOverviewView extends GetView<StudentOverviewController> {
  const StudentOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("صفحه الطالب"),
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
                style: context.textTheme.headline4!.copyWith(
                  color: AppColors.black,
                ),
              ),
              // Text(
              //   'الصف الثالث ',
              //   style: context.textTheme.headline5,
              // ),
              SubjectTile(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  final StudentOverviewController controller;
  const SubjectTile({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(
            color: AppColors.black,
            endIndent: 20,
            indent: 20,
            thickness: 1,
          ),
          Text(
            'الامتحانات ',
            style: context.textTheme.headline5,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.exams.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Display 2 items in each row
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: context.height * 0.07,
                width: context.width * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "العنوان :  ${controller.exams[index].arName}",
                      style: context.textTheme.bodyText1!
                          .copyWith(color: AppColors.light),
                    ),
                    Text(
                      "الماده :  ${controller.exams[index].subjectName}",
                      style: context.textTheme.bodyText1!
                          .copyWith(color: AppColors.light),
                    ),
                    Text(
                      ' الدرجه :  ${controller.exams[index].degree.toString()} من ${controller.exams[index].quesiotnsNum.length}',
                      style: context.textTheme.bodyText1!
                          .copyWith(color: AppColors.light),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
