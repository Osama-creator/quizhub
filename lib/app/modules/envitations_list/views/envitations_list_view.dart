import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/envitations.dart';
import 'package:quizhub/app/modules/envitations_list/controllers/envitations_list_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class EnvitationsListView extends GetView<EnvitationsListController> {
  const EnvitationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دعوات الإصدقاء'),
        centerTitle: true,
      ),
      body: GetBuilder<EnvitationsListController>(
        init: controller,
        builder: (_) {
          return ListView.builder(
            itemCount: controller.invitations.length,
            itemBuilder: (context, index) {
              final invitation = controller.invitations[index];
              return _buildEnvtCard(context, invitation);
            },
          );
        },
      ),
    );
  }

  Padding _buildEnvtCard(BuildContext context, Invitation invitation) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: context.height * 0.2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.nextPrimary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          maxRadius: 24,
                          backgroundImage: AssetImage(
                            Asset.images.teacher,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Text(
                        invitation.toUserId[0].name,
                        style: context.textTheme.headline6,
                      ),
                    ],
                  ),
                  Text(
                    invitation.exams[0].examName,
                    style: context.textTheme.headline6!.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    ' ${invitation.exams[0].subjectName} ',
                    style: context.textTheme.headline6!.copyWith(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${invitation.exams[0].createdBy.length} حل',
                        style: context.textTheme.headline6,
                      ),
                      Text(
                        '${invitation.exams[0].question.length} سؤال',
                        style: context.textTheme.headline6,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  height: context.height * 0.07,
                  width: context.width * 0.4,
                  child: Card(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            Asset.images.teacher,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        Text(
                          'أ/ حامد زكي', // Replace with actual data
                          style: context.textTheme.headline6!.copyWith(
                            color: AppColors.light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
