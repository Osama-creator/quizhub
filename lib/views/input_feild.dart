import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queen/queen.dart';

class InputField extends StatelessWidget {
  final String? label;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool enabled;
  final bool obscure;
  final int? minLines;
  final int? maxLines;
  final double radius;
  final double? height;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final String? Function(String? val)? validators;
  final String? hint;
  final EdgeInsets? padding;
  final List<TextInputFormatter>? inputFormatters;

  const InputField({
    super.key,
    this.label,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefix,
    this.suffix,
    this.padding,
    this.controller,
    this.enabled = true,
    this.obscure = false,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.validators,
    this.hint,
    this.fillColor,
    this.radius = 10,
    this.borderColor,
    this.height,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!),
          const SizedBox(height: 5),
        ],
        TextFormField(
          validator: validators,
          obscureText: obscure,
          enabled: enabled,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: obscure ? 1 : maxLines,
          minLines: minLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textAlign: TextAlign.right,
          style: context.bodyText1,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.only(
            //   right: context.width * 0.05,
            // ),
            // label: labele == null
            //     ? null
            //     : Text(
            //         labele!,
            //         style: context.bodyText1?.copyWith(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            filled: true,
            fillColor: fillColor ?? Colors.grey.shade200,
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintText: hint,
            errorStyle:
                context.bodyText1!.copyWith(color: context.theme.errorColor),
            // enabledBorder: InputBorder.none,
            // focusedBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ],
    );
  }
}
