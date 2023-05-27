import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

import 'package:quizhub/config/theme.dart';

class BookingOption extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final IconData icon;
  const BookingOption({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: context.h6,
        ),
        subtitle: Text(
          subTitle,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.subtitle1!.color,
          ),
        ),
        leading: Icon(
          icon,
          size: 30,
          color: AppColors.primary,
        ),
        trailing: const CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.nextPrimary,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 12,
            textDirection: TextDirection.rtl,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
