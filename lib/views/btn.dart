import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/views/center_loading.dart';

class Btn extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final bool isLoading;
  const Btn({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: context.height * 0.06,
        child: ElevatedButton(
          onPressed: onTap,
          child: isLoading
              ? const CenterLoading(
                  color: Colors.white,
                )
              : Center(
                  child: Text(
                    label,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.secondary,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
