import 'package:get/get.dart';
import 'package:quizhub/app/models/advice.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/app/services/auth.dart';

class GetAdviceListController extends GetxController {
  final service = Get.find<AdminService>();
  final authService = Get.find<AuthService>();
  bool lauding = false;
  List<Advice> advices = [];
  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;
    try {
      lauding = true;
      update();
      advices = await service.getAdvices(userId: userData!.id!);
    } finally {
      lauding = false;
      update();
    }
    super.onInit();
  }
}
