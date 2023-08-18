import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
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
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
        ],
        SizedBox(
          height: widget.height,
          child: TextFormField(
            validator: widget.validators,
            obscureText: widget.obscure && !passwordVisible,
            enabled: widget.enabled,
            controller: widget.controller,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: widget.obscure ? 1 : widget.maxLines,
            minLines: widget.minLines,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? Colors.grey.shade200,
              prefixIcon: widget.prefix,
              suffixIcon: widget.obscure
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      child: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    )
                  : widget.suffix,
              hintText: widget.hint,
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.grey,
                ),
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(widget.radius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
