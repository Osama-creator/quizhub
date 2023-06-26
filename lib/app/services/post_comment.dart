// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:quizhub/app/models/comment_model.dart';
import 'package:quizhub/app/models/post_model.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

import 'package:quizhub/helper/func.dart';

class PostCommentervice {
  final ApiClient client;

  PostCommentervice(this.client);
  Future<List<Post>> fetchPosts(String userId) async {
    try {
      final response = await client.post(
        Endpoints.getPosts,
        body: {
          'id': userId,
        },
      );

      final responseData = response.data;

      if (responseData['message'] == 'Done') {
        final postList = <Post>[];
        final arr = responseData['arr'] as List<dynamic>;
        for (final postArr in arr) {
          final post = Post.fromJson(postArr[0] as Map<String, dynamic>);
          postList.add(post);
        }

        return postList;
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<Post> createPost({
    required String userId,
    required String postBody,
  }) async {
    try {
      final response = await client.post(
        Endpoints.createPosts,
        body: {"title": postBody, "createdBy": userId},
      );

      final responseData = response.data;

      if (responseData['message'] == 'Done') {
        log("post has been created succfully");
        return Post(
          id: "id",
          title: postBody,
          createdBy: User(id: userId, name: "osama"),
          createdAt: DateTime.now(),
        );
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<void> deletePost({
    required String userId,
    required String postId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.deleteComment,
        body: {"id": postId, "createdBy": userId},
      );

      final responseData = response.data;

      if (responseData['message'] == 'Done') {
        log("post has been deleted succfully");
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<List<Comment>> fetchComments(String postId) async {
    try {
      final response = await client.post(
        Endpoints.getComments,
        body: {
          'postId': postId,
        },
      );
      if (response.statusCode == 200) {
        final commentsData = response.data['getComment'] as List<dynamic>;
        final comments = commentsData
            .map((comment) => Comment.fromJson(comment as Map<String, dynamic>))
            .toList();

        // Do something with the comments
        return comments;
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<Comment> createComment({
    required String userId,
    required String postId,
    required String commentBody,
  }) async {
    try {
      final response = await client.post(
        Endpoints.addComment,
        body: {
          "commBody": commentBody,
          "postId": postId,
          "createdby": "6498688caefa7c31aa92b0a9"
        },
      );

      final responseData = response.data;

      if (responseData['message'] == 'Done') {
        log("post has been created succfully $postId");
        return Comment(
          id: "id",
          commBody: commentBody,
          createdBy: User(id: userId, name: "osama"),
          likes: [],
        );
      } else {
        throw Exception('Failed to fetch posts');
      }
    } catch (e, st) {
      catchLog(e, st);
      throw Exception('Error: $e');
    }
  }

  Future<void> deleteComment({
    required String userId,
    required String commentId,
  }) async {
    try {
      final response = await client.post(
        Endpoints.deleteComment,
        body: {"idcomment": commentId, "createdBy": userId},
      );

      final responseData = response.data;

      if (responseData['message'] == 'Done') {
        log("comment has been deleted succfully");
      } else {
        throw Exception('Failed to delet comment');
      }
    } catch (e, st) {
      catchLog(e, st);
    }
  }
}
