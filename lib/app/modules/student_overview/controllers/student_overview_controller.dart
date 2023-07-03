import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';

import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/parent.dart';

class StudentOverviewController extends GetxController {
  final studentData = Get.arguments as User;
  final service = Get.find<ParentService>();
  List<ExerciseModel2> exams = [];
  @override
  Future<void> onInit() async {
    exams = await service.fetchExams(
      userId: "6499a3f690230b8ecf61875a",
      parentId: "6499a65d90230b8ecf618780",
    );
    update();
    super.onInit();
  }
}
