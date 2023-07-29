import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class CommentsPageController extends GetxController {
  final args = Get.arguments as List;
  final TextEditingController postController = TextEditingController();
  final action = Get.find<ActionHandel>();
  String postId = "";
  String userId = "";
  bool lauding = false;
  bool error = false;
  List<Comment> comments = [];
  bool isTeacher = false;

  final service = Get.find<PostCommentervice>();

  @override
  Future<void> onInit() async {
    postId = args[0] as String;
    userId = args[1] as String;
    isTeacher = args[2] as bool;

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
          userId: userId,
        );
        comments.add(newComment);
        comments = await service.fetchComments(postId);
      },
      lauding,
      error,
    );
    update();
  }

  Future<void> removeComment(String commentId) async {
    try {
      bool? done = await service.deleteComment(
        commentId: commentId,
        userId: userId,
      );
      if (done!) {
        comments.removeWhere((element) => element.id == commentId);
      } else {
        Alert.error("لا يمكن فعل هذا الامر ");
      }
    } catch (e, st) {
      catchLog(e, st);
    }
    update();
  }

  Future<void> addLike(Comment comment) async {
    await action.performAction(
      () async {
        await service.likeComment(
          commentId: comment.id,
          userId: userId,
        );
        comment.like = true;
        comment.likes.length++;
      },
      lauding,
      error,
    );
    update();
  }
}
