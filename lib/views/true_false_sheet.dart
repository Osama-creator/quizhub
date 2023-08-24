import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/generated/tr.dart';

void showAnswerSheet(bool isCorrect, String correctAnswer) {
  Get.bottomSheet(
    Container(
      color: isCorrect ? Colors.green : Colors.red,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isCorrect ? Tr.trueAn.tr : Tr.isWrong.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (!isCorrect)
            Text(
              '${Tr.trueAn.tr} هي: $correctAnswer',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    ),
    barrierColor: Colors.black54,
    elevation: 5.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    isDismissible: false,
  );
}
