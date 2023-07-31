import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/exams_card.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/config/theme.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({
    super.key,
    required this.controller,
  });

  final StudentHomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.subjects.length,
        itemBuilder: (context, index) {
          final subject = controller.subjects[index];
          return GestureDetector(
            onTap: () {
              controller.onSelectSubject(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: controller.selectedSubject == subject
                    ? AppColors.primary
                    : AppColors.nextPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                subject,
                style: TextStyle(
                  fontSize: 18,
                  color: controller.selectedSubject == subject
                      ? AppColors.light
                      : AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.controller,
  });

  final StudentHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.STUDENT_EXERCISES_LIST,
                arguments: {
                  'subject': controller.selectedSubject,
                  'userId': "6497133614d355c68609c7d2"
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  controller.selectedSubject,
                  style: context.textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  "المزيد ...",
                  style: context.textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.exercises.length,
            itemBuilder: (context, index) {
              final exerciseCard = controller.exercises[index];
              return TeacherExamsTile(
                controller: controller,
                exerciseCard: exerciseCard,
              );
            },
          ),
        ],
      ),
    );
  }
}

class TeacherExamsTile extends StatelessWidget {
  const TeacherExamsTile({
    super.key,
    required this.controller,
    required this.exerciseCard,
  });

  final StudentHomeController controller;
  final ExerciseCardModel exerciseCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 25,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: context.height * 0.23,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      exerciseCard.teacherPhoto!.isEmpty
                          ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                          : exerciseCard.teacherPhoto!,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Text(
                  exerciseCard.teacherName,
                  style: context.textTheme.titleLarge!
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exerciseCard.exercises.length +
                    exerciseCard.doneExercises.length,
                itemBuilder: (context, index) {
                  if (index < exerciseCard.exercises.length) {
                    return Row(
                      children: [
                        ExamCard(
                          exerciseCard: exerciseCard,
                          controller: controller,
                          index: index,
                        ),
                      ],
                    );
                  } else {
                    final doneExamIndex = index - exerciseCard.exercises.length;
                    return DoneExamCard(
                      exerciseCard: exerciseCard,
                      index: doneExamIndex,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  const ExamCard({
    super.key,
    required this.exerciseCard,
    required this.controller,
    required this.index,
  });

  final ExerciseCardModel exerciseCard;
  final StudentHomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final selectedExamType = exerciseCard.exercises[index].type;
        final exmaId = exerciseCard.exercises[index].id;
        controller.goToExamPage(
          exerciseType: selectedExamType,
          id: exmaId!,
        );
      },
      child: SizedBox(
        height: context.height * 0.15,
        width: context.width * 0.35,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.next2Primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                exerciseCard.exercises[index].arName,
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.light),
              ),
              Text(
                "${exerciseCard.exercises[index].quesiotnsNum.length} اسئله",
                style: context.textTheme.titleLarge!.copyWith(
                  color: AppColors.light,
                  fontSize: 14,
                ),
              ),
              Text(
                "${exerciseCard.exercises[index].viewNum.length} حل",
                style: context.textTheme.titleLarge!.copyWith(
                  color: AppColors.light,
                  fontSize: 14,
                ),
              ),
              Text(
                "النوع  ${exerciseCard.exercises[index].type} ",
                style: context.textTheme.titleLarge!.copyWith(
                  color: AppColors.light,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoneExamCard extends StatelessWidget {
  const DoneExamCard({
    super.key,
    required this.exerciseCard,
    required this.index,
  });

  final ExerciseCardModel exerciseCard;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: context.height * 0.15,
        width: context.width * 0.35,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                exerciseCard.doneExercises[index].exerciseModel.arName,
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.light),
              ),
              Text(
                "${exerciseCard.doneExercises[index].degree} / ${exerciseCard.doneExercises[index].exerciseModel.quesiotnsNum.length} الدرجه ",
                style: context.textTheme.titleLarge!.copyWith(
                  color: AppColors.light,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    required this.controller,
  });

  final AuthService controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.light,
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'option1',
            child: Text('اللغه'),
          ),
          PopupMenuItem(
            value: 'option3',
            child: Text(
              'تسجيل الخروج',
              style: context.textTheme.bodyLarge!
                  .copyWith(color: AppColors.primary),
            ),
            onTap: () async {
              await controller.signOut();
            },
          ),
        ];
      },
    );
  }
}