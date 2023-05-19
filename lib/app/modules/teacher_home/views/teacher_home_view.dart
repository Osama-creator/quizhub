import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/teacher_home/controllers/teacher_home_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class TeacherHomeView extends GetView<TeacherHomeController> {
  const TeacherHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'م/ خالد شلقامي',
          style: context.textTheme.headline6,
        ),
        centerTitle: false,
        backgroundColor: AppColors.light,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(Asset.images.teacher),
            backgroundColor: Colors.transparent,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  'مدرس تاريخ ',
                  style: context.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '20 متابع',
                  style: context.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
        elevation: 3,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          Text(
            'الصفوف الدراسيه',
            style: context.textTheme.headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          SizedBox(
            height: context.height * 0.5,
            width: context.width,
            child: GridView.builder(
              itemCount: 4,
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: context.height * 0.1,
                        width: context.width * 0.5,
                        child: Image.asset(
                          Asset.images.history,
                        ),
                      ),
                      Text(
                        "الصف الثاني",
                        style: context.textTheme.headline6,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
