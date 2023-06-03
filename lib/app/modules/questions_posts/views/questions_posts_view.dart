import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/questions_posts/controllers/questions_posts_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class QuestionsPostsView extends GetView<QuestionsPostsController> {
  const QuestionsPostsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        title: const Text('الأسئله'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPost(context),
            _buildPost(context),
            _buildPost(context)
          ],
        ),
      ),
    );
  }

  Column _buildPost(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 24,
                backgroundImage: AssetImage(
                  Asset.images.teacher,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              "أ/ خالد توفيق",
              style: context.textTheme.headline6!.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        // ignore: use_decorated_box
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 10,
                  blurRadius: 25,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد،",
                    style: context.textTheme.bodyText1!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.COMMENTS_PAGE);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تعليق",
                          style: context.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "15",
                          style: context.textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Icon(
                          Icons.mode_comment_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
