import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/helper/pick.dart';

class CreateMatchingExerciseController extends GetxController {
  final List<MatchingQuestionC> questions = [];
  void addQuestion() {
    questions.add(MatchingQuestionC());
    update();
  }
}

class MatchingQuestionC {
  TextEditingController word = TextEditingController();
  TextEditingController secondWord = TextEditingController();

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
