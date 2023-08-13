// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/true_false_exercise/controllers/true_false_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

class TFQuestionBody extends StatelessWidget {
  final String quistion;
  final String notes;
  final int index;

  final String image;
  TrueFalseExerciseController controller;

  TFQuestionBody({
    super.key,
    required this.index,
    required this.controller,
    required this.quistion,
    required this.image,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    void _openDialog(String body) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Notes"),
            content: Text(body),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }

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
              child: Text(
                quistion,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
        if (notes.isNotEmpty)
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _openDialog(notes);
                },
                icon: const Icon(
                  Icons.question_mark_outlined,
                  color: AppColors.primary,
                ),
              ),
              Text(Tr.notes.tr),
            ],
          ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: h * 0.07,
              width: w * 0.45,
              child: ElevatedButton(
                onPressed: () {
                  controller.selectChoice("true");
                },
                child: const Text("صح"),
              ),
            ),
            SizedBox(
              height: h * 0.07,
              width: w * 0.45,
              child: OutlinedButton(
                onPressed: () {
                  controller.selectChoice("false");
                },
                child: const Text("خطأ"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
