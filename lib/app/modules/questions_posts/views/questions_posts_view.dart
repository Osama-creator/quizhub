import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/post_model.dart';
import 'package:quizhub/app/modules/questions_posts/controllers/questions_posts_controller.dart';
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
                        Get.toNamed(Routes.COMMENTS_PAGE,
                            arguments: controller.posts[index].id);
                      },
                      child: _buildPost(context, controller.posts[index]),
                    );
                  },
                ),
              ),
              _buildPostInput(),
            ],
          );
        },
      ),
    );
  }

  Column _buildPost(BuildContext context, Post post) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 20,
                backgroundImage: NetworkImage(
                  post.createdBy.profilePic.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : post.createdBy.profilePic,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              post.createdBy.name,
              style: context.textTheme.headline6!.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        // ignore: use_decorated_box
        Padding(
          padding: const EdgeInsets.all(4),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      post.title,
                      style: context.textTheme.bodyText1!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "تعليق",
                        style: context.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "3",
                        // post.comments ,
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPostInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.postController,
              decoration: const InputDecoration(
                hintText: 'Write your post...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: AppColors.primary,
            ),
            onPressed: () {
              controller.addPost();
              controller.postController.clear();
            },
          ),
        ],
      ),
    );
  }
}
