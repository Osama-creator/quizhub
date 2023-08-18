import 'package:get/get.dart';
import 'package:quizhub/app/modules/admin_add_advice/controllers/admin_add_advice_controller.dart';
import 'package:quizhub/app/modules/admin_add_folowers_orders/controllers/admin_add_folowers_orders_controller.dart';
import 'package:quizhub/app/modules/admin_get_money_req/controllers/admin_get_money_req_controller.dart';
import 'package:quizhub/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:quizhub/app/modules/admin_schools_list/controllers/admin_schools_list_controller.dart';
import 'package:quizhub/app/modules/teachers_profiles_list/controllers/teachers_profiles_list_controller.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminHomeController>(AdminHomeController());
    Get.put<AdminSchoolsListController>(AdminSchoolsListController());
    Get.put<AdminAddFolowersOrdersController>(
      AdminAddFolowersOrdersController(),
    );
    Get.put<AdminGetMoneyReqController>(AdminGetMoneyReqController());
    Get.put<TeachersProfilesListController>(TeachersProfilesListController());
    Get.put<AdminAddAdviceController>(AdminAddAdviceController());
  }
}
