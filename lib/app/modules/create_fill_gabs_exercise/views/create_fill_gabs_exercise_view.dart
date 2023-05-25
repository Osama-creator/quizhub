import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_fill_gabs_exercise_controller.dart';

class CreateFillGabsExerciseView
    extends GetView<CreateFillGabsExerciseController> {
  const CreateFillGabsExerciseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateFillGabsExerciseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateFillGabsExerciseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
