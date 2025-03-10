import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopherescape/core/theme/app_styles.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const CustomTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppStyles.headline3.copyWith(
            color: theme.colorScheme.tertiary,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle != null)
          Padding(
            padding: EdgeInsets.only(top: 2.0.h),
            child: Text(
              subtitle!,
              style: AppStyles.bodyText1.copyWith(
                color: theme.colorScheme.tertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
