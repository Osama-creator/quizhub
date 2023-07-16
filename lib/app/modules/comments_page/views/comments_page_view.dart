import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/modules/comments_page/controllers/comments_page_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

//  TODO Size OF Page AND SCROLLING
class CommentsPageView extends GetView<CommentsPageController> {
  const CommentsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.comments.tr),
        centerTitle: true,
      ),
      body: GetBuilder<CommentsPageController>(
        init: controller,
        builder: (_) {
          return controller.lauding
              ? const CenterLoading()
              : controller.error
                  ? Center(
                      child: Text(Tr.errorMessage.tr),
                    )
                  : controller.comments.isEmpty
                      ? Center(
                          child: Text(Tr.noDataMessage.tr),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.comments.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onLongPress: () {
                                      controller.removeComment(
                                        controller.comments[index].id,
                                      );
                                    },
                                    child: _buildComment(
                                      context,
                                      controller.comments[index],
                                    ),
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
                  style: context.textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  comment.commBody,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      Tr.like.tr,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
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
}
