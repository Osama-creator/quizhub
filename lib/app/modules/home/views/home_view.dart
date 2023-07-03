import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/home/controllers/home_controller.dart';

import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/divider.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (_) {
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
                  backgroundImage: NetworkImage(
                    controller.teacher!.image.isEmpty
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdg7OR2pD_kj3sPHW5fmqpmXyhmDZwm_MHUXU36Ipvw4esNWqnz-iiA7AkWeqe1jla218&usqp=CAU"
                        : controller.teacher!.image,
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
                      controller.teacher!.name,
                      style: context.textTheme.headline5!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '${controller.teacher!.followStudent.length} متابع ',
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
                      "مدرس ${controller.teacher!.material}",
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
                  itemCount: controller.teacher!.exams.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final exam = controller.teacher!.exams;
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
                                exam[index].arName,
                                style: context.textTheme.headline6!.copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                              Text(
                                "${exam[index].quesiotnsNum.length} اسئله",
                                style: context.textTheme.headline6!.copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                              Text(
                                "${exam[index].viewNum.length} حل",
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
