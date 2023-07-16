import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/helper/func.dart';

class CommentsPageController extends GetxController {
  final String postId = Get.arguments as String;
  final TextEditingController postController = TextEditingController();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;
  List<Comment> comments = [];
  final service = Get.find<PostCommentervice>();

  @override
  Future<void> onInit() async {
    await action.performAction(
      () async {
        comments = await service.fetchComments(postId);
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }

  Future<void> addComment() async {
    await action.performAction(
      () async {
        final newComment = await service.createComment(
          commentBody: postController.text,
          postId: postId,
          userId: "6498688caefa7c31aa92b0a9",
        );
        comments.add(newComment);
      },
      lauding,
      error,
    );
  }

  Future<void> removeComment(String commentId) async {
    await action.performAction(
      () async {
        await service.deleteComment(
          commentId: commentId,
          userId: "6498688caefa7c31aa92b0a9",
        );
        comments.removeWhere((element) => element.id == postId);
      },
      lauding,
      error,
    );
  }
}
