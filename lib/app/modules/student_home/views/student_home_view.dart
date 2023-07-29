import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/envitations_list/views/envitations_list_view.dart';
import 'package:quizhub/app/modules/folwed_teachers/views/folwed_teachers_view.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/modules/student_home/views/home_tab.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/bottom_nav_admin.dart';

class StudentHomeView extends GetView<StudentHomeController> {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'assets/images/logo.png',
              // Replace with your app logo image path
              width: 100,
              height: 100,
              color: AppColors.light,
            ),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Get.toNamed(Routes.SEARCH_FOR_TEACHERS);
                },
              ),
              SettingButton(controller: controller.auth),
            ],
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: const [
              HomeTab(),
              FolwedTeachersView(),
              EnvitationsListView(),
            ],
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: controller.tabController.index,
            onItemSelected: (index) {
              controller.changeTab(index);
            },
            items: <BottomNavyBarItem>[
              buildBottomItem(
                title: "الرئيسيه",
                iconData: Icons.home,
                isActive: controller.tabController.index == 0,
              ),
              buildBottomItem(
                title: "المدرسين",
                iconData: Icons.people,
                isActive: controller.tabController.index == 1,
              ),
              buildBottomItem(
                title: " الدعوات",
                iconData: Icons.email,
                isActive: controller.tabController.index == 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
