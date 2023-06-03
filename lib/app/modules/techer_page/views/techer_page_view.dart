import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/techer_page/controllers/techer_page_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

import 'package:quizhub/views/divider.dart';

class TecherPageView extends GetView<TecherPageController> {
  const TecherPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("صفحه المدرس"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              maxRadius: 85,
              backgroundImage: AssetImage(
                Asset.images.teacher,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "أ/ خالد توفيق",
                  style: context.textTheme.headline5!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '39 متابع ',
                  style: context.textTheme.headline6!.copyWith(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "مدرس رياضيات",
                  style: context.textTheme.headline6!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: context.width * 0.22,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("متابعه"),
                  ),
                )
              ],
            ),
          ),
          const MyDivider(),
          Text(
            "ملخص التمارين",
            style: context.textTheme.headline6!.copyWith(),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: context.height * 0.07,
                    width: context.width * 0.35,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColors.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "تاريخ الفراعنه",
                            style: context.textTheme.headline6!.copyWith(
                              color: AppColors.light,
                            ),
                          ),
                          Text(
                            "10 اسئله",
                            style: context.textTheme.headline6!.copyWith(
                              color: AppColors.light,
                            ),
                          ),
                          Text(
                            "20 حل",
                            style: context.textTheme.headline6!.copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              // crossAxisCount: 2,
              // childAspectRatio: 1.2,
              // crossAxisSpacing: 8,
              // mainAxisSpacing: 8,
              // children: controller.subjectExams['خالد مختار']!.map((exam) {
              //   return GestureDetector(
              //     onTap: () {},
              //     child: SizedBox(
              //       height: context.height * 0.07,
              //       width: context.width * 0.35,
              //       child: Card(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         color: AppColors.primary,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Text(
              //               "تاريخ الفراعنه",
              //               style: context.textTheme.headline6!.copyWith(
              //                 color: AppColors.light,
              //               ),
              //             ),
              //             Text(
              //               "10 اسئله",
              //               style: context.textTheme.headline6!.copyWith(
              //                 color: AppColors.light,
              //               ),
              //             ),
              //             Text(
              //               "20 حل",
              //               style: context.textTheme.headline6!.copyWith(
              //                 color: AppColors.light,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   );
              // }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
