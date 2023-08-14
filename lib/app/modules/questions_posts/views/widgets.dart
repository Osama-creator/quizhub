import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/post_model.dart';
import 'package:quizhub/app/modules/questions_posts/controllers/questions_posts_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

Column buildPost(BuildContext context, Post post) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              maxRadius: 18,
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
            style: context.textTheme.titleLarge!.copyWith(
              color: AppColors.black,
              fontSize: 15,
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
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Tr.comment.tr,
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
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

Widget buildPostInput(QuestionsPostsController controller) {
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
            decoration: InputDecoration(
              hintText: Tr.writeYourPost.tr,
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
