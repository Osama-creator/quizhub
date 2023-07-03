import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_summery_controller.dart';

class TeacherSummeryView extends GetView<TeacherSummeryController> {
  const TeacherSummeryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeacherSummeryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TeacherSummeryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
