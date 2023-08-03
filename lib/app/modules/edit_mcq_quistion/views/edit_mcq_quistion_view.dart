import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/edit_mcq_quistion/controllers/edit_mcq_quistion_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/text_field.dart';

class EditMcqQuistionView extends GetView<EditMcqQuistionController> {
  const EditMcqQuistionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل السؤال'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<EditMcqQuistionController>(
          init: controller,
          builder: (_) {
            return Card(
              color: AppColors.light,
              child: Column(
                children: [
                  MyTextFeild(
                    controller: controller.questionC,
                    hintText: "السؤال",
                    labelText: "السؤال",
                  ),
                  Stack(
                    children: [
                      Container(
                        color: const Color(0x1AD1EC43),
                        width: context.width,
                        height: context.height * 0.15,
                        child: InkWell(
                          onTap: controller.pickFile,
                          child:
                              controller.image == null && controller.pic.isEmpty
                                  ? const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 40,
                                      color: AppColors.black,
                                    )
                                  : controller.pic.isNotEmpty
                                      ? Image.network(controller.pic)
                                      : Image.file(controller.image!),
                        ),
                      ),
                      if (controller.image != null)
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              controller.image = null;
                            },
                          ),
                        ),
                    ],
                  ),
                  MyTextFeild(
                    controller: controller.rightAnswerC,
                    hintText: "الإجابه الصحيحه",
                    labelText: "الإجابه الصحيحه",
                  ),
                  MyTextFeild(
                    controller: controller.wrongAnswer1C,
                    hintText: "الإجابه الخاطئه 1",
                    labelText: "الإجابه الخاطئه 1",
                  ),
                  MyTextFeild(
                    controller: controller.wrongAnswer2C,
                    hintText: "الإجابه الخاطئه 2",
                    labelText: "الإجابه الخاطئه 2",
                  ),
                  MyTextFeild(
                    controller: controller.wrongAnswer3C,
                    hintText: "الإجابه الخاطئه 3",
                    labelText: "الإجابه الخاطئه 3",
                  ),
                  MyTextFeild(
                    controller: controller.note,
                    hintText: "ملاحظه  (اختياري) ",
                    labelText: "ملاحظه  (اختياري) ",
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                    width: context.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.updateQuestion();
                      },
                      child: const Text("تعديل"),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
