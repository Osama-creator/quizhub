import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/config/theme.dart';

class MyTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final double width;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function(String)? onFieldSubmitted;
  const MyTextFeild({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.onFieldSubmitted,
    this.keyboardType,
    this.obscureText,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: context.height * 0.1,
        width: width,
        child: TextFormField(
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscureText ?? false,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted ?? (_) => false,
          cursorColor: AppColors.darkBlue,
          cursorHeight: 23,
          style: context.textTheme.bodyText1!
              .copyWith(color: AppColors.darkBlue, fontSize: 15),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            hintStyle: context.textTheme.bodyText2!
                .copyWith(color: AppColors.light, fontSize: 15),
            labelStyle: context.textTheme.bodyText2!
                .copyWith(color: AppColors.primary, fontSize: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
