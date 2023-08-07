import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/questions_posts/controllers/questions_posts_controller.dart';
import 'package:quizhub/app/modules/questions_posts/views/widgets.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

class QuestionsPostsView extends GetView<QuestionsPostsController> {
  const QuestionsPostsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        title: Text(
          Tr.questions.tr,
        ),
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
                        _dialogBuilder(context, controller.posts[index].id);
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

  Future<void> _dialogBuilder(BuildContext context, String id) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            Tr.deleteQuestion.tr,
          ),
          content: Text(
            Tr.confirmQuestionDeletion.tr,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                Tr.yes.tr,
              ),
              onPressed: () {
                controller.removePost(id);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                Tr.no.tr,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
