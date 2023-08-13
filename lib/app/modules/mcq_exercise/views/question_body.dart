// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/mcq_exercise/controllers/mcq_exercise_controller.dart';

import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

class QuestionBody extends StatelessWidget {
  final String quistion;
  final String notes;
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
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
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

    return Column(
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
            height: context.height * 0.26,
            width: context.width * 0.9,
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ],
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
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
