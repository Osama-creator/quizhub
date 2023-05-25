import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/grade_exercises/controllers/grade_exercises_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/input_feild.dart';

class ExerciseTypeSelection extends StatefulWidget {
  @override
  _ExerciseTypeSelectionState createState() => _ExerciseTypeSelectionState();
}

class _ExerciseTypeSelectionState extends State<ExerciseTypeSelection> {
  String selectedExerciseType = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        exerciseButton('اختيار'),
        exerciseButton('صح وخطأ'),
        exerciseButton('أكمل'),
        exerciseButton('توصيل'),
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
        },
        height: context.height * 0.05,
        minWidth: context.width * 0.2,
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
    builder: (BuildContext bc) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: <Widget>[
            Center(
              child: Text(
                'إنشاء تمرين جديد',
                style: context.textTheme.headline6,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: InputField(
                hint: 'إسم التمرين',
              ),
            ),
            ExerciseTypeSelection(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: context.height * 0.05,
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_CHOOSE_EXERCISE);
                  },
                  child: Text(
                    'إنشاء',
                    style: context.textTheme.headline6!.copyWith(
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
}
