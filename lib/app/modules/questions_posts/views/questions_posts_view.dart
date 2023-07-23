import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/questions_posts/controllers/questions_posts_controller.dart';
import 'package:quizhub/app/modules/questions_posts/views/widgets.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

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
      body: GetBuilder<QuestionsPostsController>(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        controller.deletePost(controller.posts[index].id);
                      },
                      onTap: () {
                        Get.toNamed(
                          Routes.COMMENTS_PAGE,
                          arguments: [
                            controller.posts[index].id,
                            controller.args['id'] as String,
                            controller.isTeacher
                          ],
                        );
                      },
                      child: buildPost(context, controller.posts[index]),
                    );
                  },
                ),
              ),
              if (!controller.isTeacher) ...[buildPostInput(controller)],
            ],
          );
        },
      ),
    );
  }
}
