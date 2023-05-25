import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/helper/pick.dart';

class CreateFillGabsExerciseController extends GetxController {
  final List<fillQuestionC> questions = [];
  void addQuestion() {
    questions.add(fillQuestionC());
    update();
  }
}

class fillQuestionC {
  TextEditingController questionC = TextEditingController();
  TextEditingController missingWordC = TextEditingController();
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
