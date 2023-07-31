import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/post_model.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class QuestionsPostsController extends GetxController {
  final TextEditingController postController = TextEditingController();
  final args = Get.arguments as Map<String, dynamic>;

  List<Post> posts = [];
  final service = Get.find<PostCommentervice>();
  bool isTeacher = false;
  String subName = "";
  @override
  Future<void> onInit() async {
    subName = args['sub_name'] as String;
    posts = await service.fetchPosts(
      userId: args['id'] as String,
      subName: subName,
    );

    isTeacher = args['is_teacher'] as bool;
    update();
    super.onInit();
  }

  Future<void> addPost() async {
    try {
      final newPost = await service.createPost(
        subName: subName,
        postBody: postController.text,
        userId: args['id'] as String,
      );
      posts.add(newPost);
      await service.fetchPosts(
        userId: args['id'] as String,
        subName: args['sub_name'] as String,
      );
      update();
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<void> removePost(String postId) async {
    try {
      bool? done = await service.deletePost(
        postId: postId,
        userId: args['id'] as String,
      );
      if (done!) {
        posts.removeWhere((element) => element.id == postId);
      } else {
        Alert.error("لا يمكن فعل هذا الامر ");
      }
    } catch (e, st) {
      catchLog(e, st);
    }

    update();
  }
}
