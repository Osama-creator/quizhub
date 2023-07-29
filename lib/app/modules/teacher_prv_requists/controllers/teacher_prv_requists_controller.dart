import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_prv_requist.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/app/services/auth.dart';

class TeacherPrvRequistsController extends GetxController {
  List<PreviousRequest> prevOrders = [];
  final authService = Get.find<AuthService>();

  final service = Get.find<FinancialsService>();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;

    await action.performAction(
      () async {
        prevOrders = await service.getTeacherPrvReq(id: userData!.id!);
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }
}
