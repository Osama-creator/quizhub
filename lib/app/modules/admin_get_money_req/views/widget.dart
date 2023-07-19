import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/money_order.dart';
import 'package:quizhub/app/modules/admin_get_money_req/controllers/admin_get_money_req_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/money_conf_b_sheet.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.controller,
    required this.order,
    required this.index,
  });

  final AdminGetMoneyReqController controller;
  final MoneyOrder order;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.nextPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      height: context.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      order.teacher.profilePic.isEmpty
                          ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                          : order.teacher.profilePic,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Text(
                  order.teacher.name,
                  style: context.textTheme.titleLarge,
                ),
                const Spacer()
              ],
            ),
            Text(
              "${Tr.phone.tr} : ${order.phone}",
              style: context.textTheme.titleLarge,
            ),
            Text(
              "${Tr.amount.tr} : ${order.amount} جنيه",
              style: context.textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      confirmMoneyOrder(context, controller, order.id),
                  child: Text(Tr.confirm.tr),
                ),
                ElevatedButton(
                  onPressed: () => controller.makePhoneCall(
                    index: index,
                  ),
                  child: Text(Tr.send.tr),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
