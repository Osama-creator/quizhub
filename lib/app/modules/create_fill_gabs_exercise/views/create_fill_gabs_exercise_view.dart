import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/create_fill_gabs_exercise/controllers/create_fill_gabs_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/text_field.dart';

class CreateFillGabsExerciseView
    extends GetView<CreateFillGabsExerciseController> {
  const CreateFillGabsExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateFillGabsExerciseController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                ),
                child: const Divider(
                  thickness: 1,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: AppColors.light,
                      child: Column(
                        children: [
                          Text(
                            'بيانات السؤال ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: AppColors.primary,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                color: const Color(0x1AD1EC43),
                                width: context.width,
                                height: context.height * 0.15,
                                child: InkWell(
                                  onTap: controller.questions[index].pickFile,
                                  child: controller.questions[index].image ==
                                          null
                                      ? const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 40,
                                          color: AppColors.black,
                                        )
                                      : Image.file(
                                          controller.questions[index].image!,
                                        ),
                                ),
                              ),
                              if (controller.questions[index].image != null)
                                Positioned(
                                  left: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete_forever,
                                    ),
                                    onPressed: () {
                                      controller.questions[index].image = null;
                                    },
                                  ),
                                ),
                            ],
                          ),
                          MyTextFeild(
                            controller: controller.questions[index].questionC,
                            hintText: "السؤال",
                            labelText: "السؤال",
                          ),
                          MyTextFeild(
                            controller:
                                controller.questions[index].missingWordC,
                            hintText: "الكلمه الناقصه",
                            labelText: "الكلمه الناقصه",
                          ),
                          MyTextFeild(
                            controller: controller.questions[index].noteC,
                            hintText: "ملاحظه  (اختياري) ",
                            labelText: "ملاحظه  (اختياري) ",
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                  vertical: 10,
                ),
                child: SizedBox(
                  height: context.height * 0.06,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: context.width * 0.2,
                        child: ElevatedButton(
                          onPressed: () => controller.addQuestion(),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: context.width * 0.57,
                        child: ElevatedButton(
                          onPressed: () => controller.onSubmit(),
                          child: Text(
                            'إنشاء التدريب',
                            style: context.textTheme.headline6!.copyWith(
                              fontSize: 18,
                              color: AppColors.light,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
