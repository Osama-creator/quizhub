import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/admin_add_advice/views/admin_add_advice_view.dart';
import 'package:quizhub/app/modules/admin_add_folowers_orders/views/admin_add_folowers_orders_view.dart';
import 'package:quizhub/app/modules/admin_get_money_req/views/admin_get_money_req_view.dart';
import 'package:quizhub/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:quizhub/app/modules/admin_schools_list/views/admin_schools_list_view.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/app/modules/teachers_profiles_list/views/teachers_profiles_list_view.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/bottom_nav_admin.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              SettingButton(
                controller: Get.find<AuthService>(),
                color: AppColors.primary,
                textColor: AppColors.light,
              )
            ],
            title: Text(
              Tr.admin.tr,
              style: context.textTheme.titleLarge,
            ),
            centerTitle: true,
            backgroundColor: AppColors.light,
            elevation: 3,
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: const [
              AdminSchoolsListView(),
              TeachersProfilesListView(),
              AdminAddFolowersOrdersView(),
              AdminGetMoneyReqView(),
              AdminAddAdviceView(),
            ],
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: controller.tabController.index,
            onItemSelected: (index) {
              controller.changeTab(index);
            },
            items: <BottomNavyBarItem>[
              buildBottomItem(
                title: Tr.schoold.tr,
                iconData: Icons.home,
                isActive: controller.tabController.index == 0,
              ),
              buildBottomItem(
                title: Tr.confirm.tr,
                iconData: Icons.confirmation_num,
                isActive: controller.tabController.index == 1,
              ),
              buildBottomItem(
                title: Tr.moneyRequists.tr,
                iconData: Icons.attach_money_sharp,
                isActive: controller.tabController.index == 2,
              ),
              buildBottomItem(
                title: Tr.addFRequist.tr,
                iconData: Icons.add_box_rounded,
                isActive: controller.tabController.index == 3,
              ),
              buildBottomItem(
                title: Tr.advices.tr,
                iconData: Icons.subject_rounded,
                isActive: controller.tabController.index == 4,
              ),
            ],
          ),
        );
      },
    );
  }
}

// class ListTileCust extends StatelessWidget {
//   const ListTileCust({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           color: AppColors.nextPrimary,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         height: context.height * 0.1,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: CircleAvatar(
//                 backgroundImage: AssetImage(Asset.images.teacher),
//                 backgroundColor: Colors.transparent,
//               ),
//             ),
//             Text(
//               'أحمد سيد',
//               style: context.textTheme.headline6,
//             ),
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Text(
//                 '200 ج',
//                 style: context.textTheme.headline6!
//                     .copyWith(color: AppColors.black),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
