import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_prv_requist.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/helper/func.dart';

class TeacherPrvRequistsController extends GetxController {
  final userId = Get.arguments as String;
  List<PreviousRequest> prevOrders = [];
  final authService = Get.find<AuthService>();

  final service = Get.find<FinancialsService>();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    await action.performAction(
      () async {
        prevOrders = await service.getTeacherPrvReq(id: userId);
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }
}
