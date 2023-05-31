import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/financial_dues/controllers/financial_dues_controller.dart';
import 'package:quizhub/config/theme.dart';

class FinancialDuesView extends GetView<FinancialDuesController> {
  const FinancialDuesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المستحقات الماليه'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي المشاهدات",
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
                Text(
                  "250 ",
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' عدد المتابعين',
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
                Text(
                  "450 ",
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي  المستحقات",
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
                Text(
                  "200 ",
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.2,
            ),
            SizedBox(
              height: context.height * 0.06,
              width: context.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'طلب زيادة المتابعين',
                  style: context.textTheme.headline6!.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: context.height * 0.06,
              width: context.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'طلب سحب المستحقات',
                  style: context.textTheme.headline6!.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}