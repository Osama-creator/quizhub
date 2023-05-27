import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';

class EditExerciseView extends GetView<EditExerciseController> {
  const EditExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مصر القديمه'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: context.height * 0.06,
                width: context.width * 0.35,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("إعاده نشر"),
                ),
              ),
              SizedBox(
                height: context.height * 0.06,
                width: context.width * 0.35,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("تعديل"),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: context.height * 0.8,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: context.height * 0.3,
                    child: Card(
                      color: AppColors.nextPrimary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "كم عدد أنهار العالم",
                            style: context.textTheme.headline6!
                                .copyWith(color: AppColors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "4 أنهار",
                                style: context.textTheme.headline6,
                              ),
                              Text(
                                "4 أنهار",
                                style: context.textTheme.headline6,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "4 أنهار",
                                style: context.textTheme.headline6,
                              ),
                              Text(
                                "4 أنهار",
                                style: context.textTheme.headline6,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
