import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/student_overview/controllers/student_overview_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class StudentOverviewView extends GetView<StudentOverviewController> {
  const StudentOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                maxRadius: 85,
                backgroundImage: AssetImage(Asset.images.teacher),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              ' أحمد سيد',
              style: context.textTheme.headline4!.copyWith(
                color: AppColors.black,
              ),
            ),
            Text(
              'الصف الثالث ',
              style: context.textTheme.headline5,
            ),
            const SubjectTile(),
            const SubjectTile(),
            const SubjectTile()
          ],
        ),
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  const SubjectTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.17,
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
            'اللغه العربيه',
            style: context.textTheme.headline5,
          ),
          SizedBox(
            height: context.height * 0.1,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
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
                        'أنواع الخبر',
                        style: context.textTheme.bodyText1!
                            .copyWith(color: AppColors.light),
                      ),
                      Text(
                        '20 / 20',
                        style: context.textTheme.bodyText1!
                            .copyWith(color: AppColors.light),
                      ),
                      Text(
                        'ا / علاء الدين ',
                        style: context.textTheme.bodyText1!
                            .copyWith(color: AppColors.light),
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
