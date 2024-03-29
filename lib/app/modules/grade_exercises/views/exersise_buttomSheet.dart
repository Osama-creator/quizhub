import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/grade_exercises/controllers/grade_exercises_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/input_feild.dart';

class ExerciseTypeSelection extends StatefulWidget {
  final Function(String) onExerciseTypeSelected;

  const ExerciseTypeSelection({required this.onExerciseTypeSelected});
  @override
  _ExerciseTypeSelectionState createState() => _ExerciseTypeSelectionState();
}

class _ExerciseTypeSelectionState extends State<ExerciseTypeSelection> {
  String selectedExerciseType = 'اختيار';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        exerciseButton('اختيار'),
        exerciseButton('صح وخطأ'),
        exerciseButton('أكمل'),
        exerciseButton('توصيل'),
        exerciseButton('ترتيب'),
      ],
    );
  }

  Widget exerciseButton(String exerciseType) {
    final bool isSelected = selectedExerciseType == exerciseType;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            selectedExerciseType = exerciseType;
          });
          widget.onExerciseTypeSelected(exerciseType);
        },
        height: context.height * 0.05,
        minWidth: context.width * 0.15,
        color: isSelected ? AppColors.primary : AppColors.grey,
        textColor: isSelected ? AppColors.light : AppColors.black,
        child: Text(exerciseType),
      ),
    );
  }
}

void excDetailsBottomSheet(
  BuildContext context,
  GradeExercisesController controller,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext bc) {
      return GetBuilder<GradeExercisesController>(
        init: controller,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    Tr.createNewExercise.tr,
                    style: context.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputField(
                    hint: Tr.exerciseName.tr,
                    controller: controller.eNameC,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputField(
                    hint: Tr.exerciseTime.tr,
                    keyboardType: TextInputType.number,
                    controller: controller.eTimeC,
                  ),
                ),
                ExerciseTypeSelection(
                  onExerciseTypeSelected: (exerciseType) {
                    controller.setSelectedExerciseType(exerciseType);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: context.height * 0.05,
                    width: context.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller.submet();
                      },
                      child: controller.loading
                          ? const CenterLoading()
                          : Text(
                              Tr.create.tr,
                              style: context.textTheme.titleLarge!.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
