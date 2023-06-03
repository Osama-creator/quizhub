import 'package:get/get.dart';

import '../controllers/comments_page_controller.dart';

class CommentsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentsPageController>(
      () => CommentsPageController(),
    );
  }
}
