import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/edit_mcq_quistion/controllers/edit_mcq_quistion_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/text_field.dart';

class EditMcqQuistionView extends GetView<EditMcqQuistionController> {
  const EditMcqQuistionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Tr.edit.tr,
        ),
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
                    hintText: Tr.question.tr,
                    labelText: Tr.question.tr,
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
                    hintText: Tr.trueAn.tr,
                    labelText: Tr.trueAn.tr,
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
                  SizedBox(
                    height: context.height * 0.05,
                    width: context.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller.updateQuestion();
                      },
                      child: Text(
                        Tr.edit.tr,
                      ),
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
