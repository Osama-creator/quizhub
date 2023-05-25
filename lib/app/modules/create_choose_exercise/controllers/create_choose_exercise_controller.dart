import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizhub/helper/pick.dart';

class CreateChooseExerciseController extends GetxController {
  final List<QuestionC> questions = [];
  void addQuestion() {
    questions.add(QuestionC());
    update();
  }
}

class QuestionC {
  TextEditingController questionC = TextEditingController();
  TextEditingController rightAnswerC = TextEditingController();
  TextEditingController wrongAnswer1C = TextEditingController();
  TextEditingController wrongAnswer3C = TextEditingController();
  TextEditingController wrongAnswer2C = TextEditingController();
  String imageString = "";
  late bool imageUploaded;
  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
    }
  }
}
