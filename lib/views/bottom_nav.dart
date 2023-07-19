import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:quizhub/config/theme.dart';

BottomNavyBarItem buildBottomItem({
  required String title,
  required IconData iconData,
  required bool isActive,
}) {
  return BottomNavyBarItem(
    activeColor: const Color(0xfffefaec),
    title: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.light,
          ),
        ),
      ),
    ),
    icon: Icon(
      iconData,
      color: isActive ? AppColors.primary : const Color(0xffc2c2c2),
    ),
  );
}
