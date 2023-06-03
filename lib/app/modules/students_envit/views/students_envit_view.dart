import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/students_envit/controllers/students_envit_controller.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';

class StudentsEnvitView extends GetView<StudentsEnvitController> {
  const StudentsEnvitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تمرين على أنواع الخبر'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStudentTile(context),
          _buildStudentTile(context),
          _buildStudentTile(context),
          _buildStudentTile(context),
          _buildStudentTile(context),
          _buildStudentTile(context),
          _buildStudentTile(context),
        ],
      ),
    );
  }

  Padding _buildStudentTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.nextPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                maxRadius: 25,
                backgroundImage: AssetImage(
                  Asset.images.teacher,
                ),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "حماده هلال",
                style: context.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: context.width * 0.22,
                height: context.height * 0.055,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("دعوة"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
