import 'package:get/get.dart';

import '../controllers/questions_posts_controller.dart';

class QuestionsPostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsPostsController>(
      () => QuestionsPostsController(),
    );
  }
}
