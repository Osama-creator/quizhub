import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/generated/tr.dart';
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
    try {
      lauding = true;
      update();
      comments = await service.fetchComments(postId);
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }

    super.onInit();
  }

  Future<void> addComment() async {
    try {
      lauding = true;
      update();
      await service.createComment(
        commentBody: postController.text,
        postId: postId,
        userId: userId,
      );
      comments = await service.fetchComments(postId);
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
  }

  Future<void> removeComment(String commentId) async {
    try {
      lauding = true;
      update();
      bool? done = await service.deleteComment(
        commentId: commentId,
        userId: userId,
      );
      if (done!) {
        comments.removeWhere((element) => element.id == commentId);
      } else {
        Alert.error(Tr.cannotPerformAction.tr);
      }
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
  }

  Future<void> addLike(Comment comment) async {
    try {
      lauding = true;
      update();
      await service.likeComment(
        commentId: comment.id,
        userId: userId,
      );
      comment.like = true;
      comment.likes.length++;
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
  }
}
