import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/envitations.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

Padding buildEnvtCard(BuildContext context, Invitation invitation) {
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
                        maxRadius: 20,
                        backgroundImage: NetworkImage(
                          invitation.toUserId[0].profilePic.isEmpty
                              ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                              : invitation.toUserId[0].profilePic,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Text(
                      invitation.toUserId[0].name,
                      style: context.textTheme.titleSmall!
                          .copyWith(color: AppColors.black),
                    ),
                  ],
                ),
                Text(
                  invitation.exams[0].examName,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ' ${invitation.exams[0].subjectName} ',
                  style: context.textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ' ${invitation.exams[0].kindOfQuestions} ',
                  style: context.textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${invitation.exams[0].createdBy.length} ${Tr.ans.tr}',
                      style:
                          context.textTheme.titleLarge!.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${invitation.exams[0].question.length} ${Tr.questions.tr}",
                      style:
                          context.textTheme.titleLarge!.copyWith(fontSize: 16),
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
                        maxRadius: 35,
                        backgroundImage: NetworkImage(
                          invitation.exams[0].createdBy[0].profilePic.isEmpty
                              ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                              : invitation.exams[0].createdBy[0].profilePic,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        invitation.exams[0].createdBy[0].name,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: AppColors.light,
                          fontSize: 15,
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
