import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/modules/comments_page/controllers/comments_page_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

//  TODO Size OF Page AND SCROLLING
class CommentsPageView extends GetView<CommentsPageController> {
  const CommentsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التعليقات'),
        centerTitle: true,
      ),
      body: GetBuilder<CommentsPageController>(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.comments.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        controller.removeComment(controller.comments[index].id);
                      },
                      child: _buildComment(context, controller.comments[index]),
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

  Widget _buildPostInput() {
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
              decoration: const InputDecoration(
                hintText: 'Write your comment...',
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

  Row _buildComment(BuildContext context, Comment comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            maxRadius: 27,
            backgroundImage: AssetImage(
              Asset.images.teacher,
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
                  style: context.textTheme.headline6!.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  comment.commBody,
                  style: context.textTheme.bodyText1!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "أعجبني",
                      style: context.textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      comment.likes.length.toString(),
                      style: context.textTheme.headline6!.copyWith(
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
}
