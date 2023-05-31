import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_exercises_list_controller.dart';

class StudentExercisesListView extends GetView<StudentExercisesListController> {
  const StudentExercisesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudentExercisesListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StudentExercisesListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
