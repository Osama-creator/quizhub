// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizhub/app/modules/mcq_exercise/controllers/mcq_exercise_controller.dart';

import 'package:quizhub/config/theme.dart';

class QuestionBody extends StatelessWidget {
  final String quistion;
  final int index;
  final List<String> list;
  final String image;
  McqExerciseController controller;

  QuestionBody({
    super.key,
    required this.index,
    required this.controller,
    required this.quistion,
    required this.list,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: context.height * 0.4,
            width: context.width * 0.9,
            child: Center(
              child: Column(
                children: [
                  Text(
                    quistion,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (image.isNotEmpty) ...[
                    SizedBox(
                      height: context.height * 0.3,
                      width: context.width * 0.8,
                      child: Image.network(
                        image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ...list.map(
                (option) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: h * 0.07,
                    width: w * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: RadioListTile(
                        value: option,
                        groupValue: controller.quistionList[index].userChoice,
                        activeColor: AppColors.primary,
                        dense: false,
                        onChanged: (value) {
                          controller.selectChoice(value!);
                        },
                        title: Text(
                          option,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
