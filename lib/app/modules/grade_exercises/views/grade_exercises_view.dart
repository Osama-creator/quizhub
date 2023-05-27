import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/grade_exercises/controllers/grade_exercises_controller.dart';
import 'package:quizhub/app/modules/grade_exercises/views/exersise_buttomSheet.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

class GradeExercisesView extends GetView<GradeExercisesController> {
  const GradeExercisesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التمارين',
          style: context.textTheme.headline5!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: AppColors.light,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'الصف الثالث',
              style: context.textTheme.headline6,
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
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.EDIT_EXERCISE);
                  },
                  child: Card(
                    color: AppColors.nextPrimary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "تاريخ الفراعنه",
                          style: context.textTheme.headline6,
                        ),
                        Text(
                          "10 اسئله",
                          style: context.textTheme.headline6,
                        ),
                        Text(
                          "20 حل",
                          style: context.textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          excDetailsBottomSheet(context, controller);
        },
        backgroundColor: AppColors.primary,
        label: Text(
          'إنشاء تمرين جديد',
          style: context.textTheme.bodyText1!
              .copyWith(fontSize: 16, color: AppColors.light),
        ),
        icon: const Icon(
          Icons.add,
          color: AppColors.light,
        ),
      ),
    );
  }
}
