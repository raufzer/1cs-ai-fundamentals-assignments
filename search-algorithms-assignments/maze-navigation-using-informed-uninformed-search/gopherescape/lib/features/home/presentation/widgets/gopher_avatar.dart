import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopherescape/core/theme/app_theme_extension.dart';
import 'package:gopherescape/core/utils/app_assets.dart';

class GopherAvatar extends StatelessWidget {
  const GopherAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<AppThemeExtension>();
    return Center(
      child: Container(
        width: 219.w,
        height: 219.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: customTheme!.additionalColor2, width: 10.w),
        ),
        child: ClipOval(
          child: Image.asset(
            AssetsData.gopherEscapeAvatar,
            fit: BoxFit.cover,
            width: 209.w,
            height: 209.h,
          ),
        ),
      ),
    );
  }
}
