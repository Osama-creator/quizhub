import 'package:get/get.dart';
import 'package:quizhub/app/services/auth.dart';

import '../../../controllers/auth_controller.dart';

class HomeController extends GetxController {
  final service = Get.find<AuthService>();
}
