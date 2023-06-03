import 'package:flutter/material.dart';

import 'package:quizhub/config/theme.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.primary,
      endIndent: 20,
      indent: 20,
      thickness: 1,
    );
  }
}
