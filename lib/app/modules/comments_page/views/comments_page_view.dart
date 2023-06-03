import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/comments_page/controllers/comments_page_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

//  TODO Size OF Page AND SCROLLING
class CommentsPageView extends GetView<CommentsPageController> {
  const CommentsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التعليقات'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildComment(context),
          _buildComment(context),
          _buildComment(context),
          const Spacer(),
          Container(
            height: context.height * 0.07,
            width: context.width,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "أكتب تعليق",
                    style: context.textTheme.headline6!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.15,
                  color: AppColors.primary,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      textDirection: TextDirection.ltr,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildComment(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            maxRadius: 27,
            backgroundImage: AssetImage(
              Asset.images.teacher,
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "أ/ خالد توفيق",
                  style: context.textTheme.headline6!.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "هذا النص هو مثال  النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد،",
                  style: context.textTheme.bodyText1!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "أعجبني",
                      style: context.textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "15",
                      style: context.textTheme.headline6!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
