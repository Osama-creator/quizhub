import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/comments_page/controllers/comments_page_controller.dart';
import 'package:quizhub/app/modules/comments_page/views/widget.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

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
                  : Column(
                      children: [
                        if (controller.comments.isEmpty) ...[
                          const Spacer(),
                          Center(
                            child: Text(Tr.noDataMessage.tr),
                          ),
                          const Spacer()
                        ] else
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.comments.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onLongPress: () {
                                    _dialogBuilder(
                                      context,
                                      controller.comments[index].id,
                                    );
                                  },
                                  child: buildComment(
                                    context,
                                    controller.comments[index],
                                    controller,
                                  ),
                                );
                              },
                            ),
                          ),
                        buildCommentInput(controller),
                      ],
                    );
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String id) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حذف التعليق'),
          content: const Text(
            "هل انت متأكد من حذف التعليق",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('نعم'),
              onPressed: () {
                controller.removeComment(id);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('لا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
