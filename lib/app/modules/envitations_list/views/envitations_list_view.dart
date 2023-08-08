import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/envitations_list/controllers/envitations_list_controller.dart';
import 'package:quizhub/app/modules/envitations_list/views/widgets.dart';
import 'package:quizhub/generated/tr.dart';

class EnvitationsListView extends GetView<EnvitationsListController> {
  const EnvitationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.friendsInvitations.tr),
        centerTitle: true,
      ),
      body: GetBuilder<EnvitationsListController>(
        init: controller,
        builder: (_) {
          return ListView.builder(
            itemCount: controller.invitations.length,
            itemBuilder: (context, index) {
              final invitation = controller.invitations[index];
              return InkWell(
                onTap: () {
                  final id = invitation.exams[0].id;
                  final exerciseType = invitation.exams[0].kindOfQuestions;
                  controller.studentHome
                      .goToExamPage(id: id, exerciseType: exerciseType);
                },
                child: buildEnvtCard(context, invitation),
              );
            },
          );
        },
      ),
    );
  }
}
