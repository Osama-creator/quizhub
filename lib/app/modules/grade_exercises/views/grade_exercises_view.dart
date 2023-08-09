import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/grade_exercises/controllers/grade_exercises_controller.dart';
import 'package:quizhub/app/modules/grade_exercises/views/exersise_buttomSheet.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

class GradeExercisesView extends GetView<GradeExercisesController> {
  const GradeExercisesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          Tr.exams.tr,
          style: context.textTheme.headlineSmall!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.light,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitle(context),
            SizedBox(
              height: context.height * 0.05,
            ),
            GetBuilder<GradeExercisesController>(
              init: controller,
              builder: (_) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.exercises.length,
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.90,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(
                        Routes.EDIT_EXERCISE,
                        arguments: [
                          controller.exercises[index].id,
                          controller.exercises[index].type
                        ],
                      ),
                      child: Card(
                        color: AppColors.nextPrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controller.exercises[index].arName!,
                              style: context.textTheme.titleLarge,
                            ),
                            Text(
                              "${controller.exercises[index].quesiotnsNum!.length} ${Tr.questions.tr}",
                              style: context.textTheme.titleLarge,
                            ),
                            Text(
                              "${controller.exercises[index].viewNum!.length} ${Tr.ans.tr}",
                              style: context.textTheme.titleLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                controller.deleteExercise(
                                  controller.exercises[index].id!,
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          excDetailsBottomSheet(context, controller);
        },
        backgroundColor: AppColors.primary,
        label: Text(
          Tr.createNewExercise.tr,
          style: context.textTheme.bodyLarge!
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
                  .titleLarge!
                  .copyWith(color: AppColors.light, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
