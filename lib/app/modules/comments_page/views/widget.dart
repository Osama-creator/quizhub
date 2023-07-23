import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/modules/comments_page/controllers/comments_page_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

Widget buildCommentInput(CommentsPageController controller) {
  return Container(
    height: 65,
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
              hintText: Tr.writeYourComment.tr,
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
            controller.addComment();
            controller.postController.clear();
          },
        ),
      ],
    ),
  );
}

Row buildComment(
  BuildContext context,
  Comment comment,
  CommentsPageController controller,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          maxRadius: 27,
          backgroundImage: NetworkImage(
            comment.createdBy.profilePic.isEmpty
                ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                : comment.createdBy.profilePic,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                comment.createdBy.name,
                style: context.textTheme.titleLarge!.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                comment.commBody,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: controller.isTeacher
                      ? AppColors.black
                      : AppColors.darkBlue,
                  fontWeight: controller.isTeacher
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.addLike(comment),
                    child: Text(
                      Tr.like.tr,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: comment.like == true ? Colors.red : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    comment.likes.length.toString(),
                    style: context.textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
