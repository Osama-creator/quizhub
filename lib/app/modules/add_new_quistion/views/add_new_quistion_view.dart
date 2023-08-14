import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/add_new_quistion/controllers/add_new_quistion_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/text_field.dart';

class AddNewQuistionView extends GetView<AddNewQuistionController> {
  const AddNewQuistionView({super.key});
  Widget _getQuestionWidget(String type, BuildContext context) {
    switch (type) {
      case "choose":
        return _choosingWidget(context);
      case "true_false":
        return _trueFalseWidget(context);
      case "fill_gabs":
        return _fillGabsWidget(context);
      case "matching":
        return _matchingWidget(context);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewQuistionController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.2,
                  ),
                  Card(child: _getQuestionWidget(controller.type, context)),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.addQuesion();
                    },
                    child: controller.isLoading
                        ? const CenterLoading()
                        : Text(Tr.save.tr),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _choosingWidget(BuildContext context) {
    return Column(
      children: [
        MyTextFeild(
          controller: controller.questionC,
          hintText: Tr.question.tr,
          labelText: Tr.question.tr,
        ),
        ImageWidget(
          controller: controller,
        ),
        MyTextFeild(
          controller: controller.rightAnswerC,
          hintText: Tr.correctAnswer.tr,
          labelText: Tr.correctAnswer.tr,
        ),
        MyTextFeild(
          controller: controller.wrongAnswer1C,
          hintText: Tr.wrongAnswer1.tr,
          labelText: Tr.wrongAnswer1.tr,
        ),
        MyTextFeild(
          controller: controller.wrongAnswer2C,
          hintText: Tr.wrongAnswer2.tr,
          labelText: Tr.wrongAnswer2.tr,
        ),
        MyTextFeild(
          controller: controller.wrongAnswer3C,
          hintText: Tr.wrongAnswer3.tr,
          labelText: Tr.wrongAnswer3.tr,
        ),
        MyTextFeild(
          controller: controller.note,
          hintText: Tr.optionalNote.tr,
          labelText: Tr.optionalNote.tr,
        ),
      ],
    );
  }

  Widget _trueFalseWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.2,
        ),
        ImageWidget(
          controller: controller,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: context.height * 0.1,
              width: context.width * 0.45,
              child: MyTextFeild(
                controller: controller.questionC,
                hintText: Tr.question.tr,
                labelText: Tr.question.tr,
              ),
            ),
            SizedBox(
              height: context.height * 0.1,
              width: context.width * 0.45,
              child: DropdownButtonFormField<String>(
                value: controller.answer,
                decoration: InputDecoration(
                  labelText: Tr.correctAnswer.tr,
                ),
                onChanged: (newValue) {
                  controller.answer = newValue;
                },
                items: <String>['true', 'false']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        MyTextFeild(
          controller: controller.note,
          hintText: Tr.optionalNote.tr,
          labelText: Tr.optionalNote.tr,
        ),
      ],
    );
  }

  Widget _fillGabsWidget(BuildContext context) {
    return Column(
      children: [
        ImageWidget(
          controller: controller,
        ),
        MyTextFeild(
          controller: controller.questionC,
          hintText: Tr.question.tr,
          labelText: Tr.question.tr,
        ),
        MyTextFeild(
          controller: controller.rightAnswerC,
          hintText: Tr.missingWord.tr,
          labelText: Tr.missingWord.tr,
        ),
        MyTextFeild(
          controller: controller.note,
          hintText: Tr.optionalNote.tr,
          labelText: Tr.optionalNote.tr,
        ),
      ],
    );
  }

  Widget _matchingWidget(BuildContext context) {
    return Column(
      children: [
        MyTextFeild(
          controller: controller.questionC,
          hintText: Tr.word.tr,
          labelText: Tr.word.tr,
        ),
        MyTextFeild(
          controller: controller.rightAnswerC,
          hintText: Tr.relatedWord.tr,
          labelText: Tr.relatedWord.tr,
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.controller,
  });

  final AddNewQuistionController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0x1AD1EC43),
          width: context.width,
          height: context.height * 0.15,
          child: InkWell(
            onTap: controller.pickFile,
            child: controller.image == null
                ? const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: AppColors.black,
                  )
                : Image.file(
                    controller.image!,
                  ),
          ),
        ),
        if (controller.image != null)
          Positioned(
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever,
              ),
              onPressed: () {
                controller.image = null;
              },
            ),
          ),
      ],
    );
  }
}
