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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'التمارين',
          style: context.textTheme.headline5!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.light,
        elevation: 3,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(context),
          SizedBox(
            height: context.height * 0.05,
          ),
          GetBuilder<GradeExercisesController>(
            init: controller,
            builder: (_) {
              return SizedBox(
                height: context.height * 0.5,
                width: context.width,
                child: GridView.builder(
                  itemCount: controller.exercises.length,
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.90,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onDoubleTap: () {
                        controller
                            .deleteExercise(controller.exercises[index].id!);
                      },
                      onTap: () {
                        Get.toNamed(Routes.EDIT_EXERCISE);
                      },
                      child: Card(
                        color: AppColors.nextPrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controller.exercises[index].arName,
                              style: context.textTheme.headline6,
                            ),
                            Text(
                              "${controller.exercises[index].quesiotnsNum.length} اسئله",
                              style: context.textTheme.headline6,
                            ),
                            Text(
                              "${controller.exercises[index].viewNum.length} حل",
                              style: context.textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
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

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: Card(
        elevation: 4,
        color: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: context.height * 0.07,
          child: Center(
            child: Text(
              controller.gradeName,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppColors.light, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
