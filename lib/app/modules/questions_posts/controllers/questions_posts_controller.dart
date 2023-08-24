import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/post_model.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class QuestionsPostsController extends GetxController {
  final TextEditingController postController = TextEditingController();
  final args = Get.arguments as Map<String, dynamic>;

  List<Post> posts = [];
  final service = Get.find<PostCommentervice>();
  bool isTeacher = false;
  String subName = "";
  bool loading = false;
  @override
  Future<void> onInit() async {
    subName = args['sub_name'] as String;
    isTeacher = args['is_teacher'] as bool;
    try {
      loading = true;
      update();
      posts = await service.fetchPosts(
        userId: args['id'] as String,
        subName: subName,
      );
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }

    super.onInit();
  }

  Future<void> addPost() async {
    try {
      loading = true;
      update();
      if (postController.text.isNotEmpty) {
        await service.createPost(
          userId: args['id'] as String,
          subName: args['sub_name'] as String,
          postBody: postController.text,
        );
      }
      Get.find<QuestionsPostsController>().onInit();
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> removePost(String postId) async {
    try {
      final bool? done = await service.deletePost(
        postId: postId,
        userId: args['id'] as String,
      );
      if (done!) {
        posts.removeWhere((element) => element.id == postId);
      } else {
        Alert.error(
          Tr.cannotPerformAction.tr,
        );
      }
    } catch (e, st) {
      catchLog(e, st);
    }
    update();
  }
}
