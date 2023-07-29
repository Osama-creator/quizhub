import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/post_model.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/helper/func.dart';

class QuestionsPostsController extends GetxController {
  final TextEditingController postController = TextEditingController();
  final args = Get.arguments as Map<String, dynamic>;

  List<Post> posts = [];
  final service = Get.find<PostCommentervice>();
  bool isTeacher = false;

  @override
  Future<void> onInit() async {
    posts = await service.fetchPosts(
      userId: args['id'] as String,
      subName: args['sub_name'] as String,
    );
    isTeacher = args['is_teacher'] as bool;
    update();
    super.onInit();
  }

  Future<void> addPost() async {
    try {
      final newPost = await service.createPost(
        postBody: postController.text,
        userId: args['id'] as String,
      );
      posts.add(newPost);
      update();
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<void> deletePost(String postId) async {
    await service.deletePost(
      postId: postId,
      userId: args['id'] as String,
    );
    posts.removeWhere((element) => element.id == postId);
    update();
  }
}
