import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/services/post_comment.dart';

class CommentsPageController extends GetxController {
  final String postId = Get.arguments as String;
  final TextEditingController postController = TextEditingController();

  List<Comment> comments = [];
  final service = Get.find<PostCommentervice>();

  @override
  Future<void> onInit() async {
    comments = await service.fetchComments(postId);
    update();
    super.onInit();
  }

  Future<void> addComment() async {
    final newComment = await service.createComment(
      commentBody: postController.text,
      postId: postId,
      userId: "6498688caefa7c31aa92b0a9",
    );

    comments.add(newComment);
    update();
  }

  Future<void> removeComment(String commentId) async {
    await service.deleteComment(
      commentId: commentId,
      userId: "6498688caefa7c31aa92b0a9",
    );
    comments.removeWhere((element) => element.id == postId);
    update();
  }
}
