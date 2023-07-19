import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/admin_add_folowers_orders/views/admin_add_folowers_orders_view.dart';
import 'package:quizhub/app/modules/admin_get_money_req/views/admin_get_money_req_view.dart';
import 'package:quizhub/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:quizhub/app/modules/admin_schools_list/views/admin_schools_list_view.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/bottom_nav.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'الإداره',
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
              AdminAddFolowersOrdersView(),
              AdminGetMoneyReqView(),
            ],
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: controller.tabController.index,
            onItemSelected: (index) {
              controller.changeTab(index);
            },
            items: <BottomNavyBarItem>[
              buildBottomItem(
                title: "المدارس",
                iconData: Icons.home,
                isActive: controller.tabController.index == 0,
              ),
              buildBottomItem(
                title: "طلبات المال",
                iconData: Icons.attach_money_sharp,
                isActive: controller.tabController.index == 1,
              ),
              buildBottomItem(
                title: "طلبات الزياده",
                iconData: Icons.add_box_rounded,
                isActive: controller.tabController.index == 2,
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
