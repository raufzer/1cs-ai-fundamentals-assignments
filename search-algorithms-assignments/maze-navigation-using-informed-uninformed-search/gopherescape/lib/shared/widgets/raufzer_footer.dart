import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gopher_escape_app/core/theme/app_sizes.dart';
import 'package:gopher_escape_app/core/theme/app_spacing.dart';
import 'package:gopher_escape_app/core/utils/app_assets.dart';
import 'package:gopher_escape_app/core/theme/app_styles.dart';
import 'package:gopher_escape_app/core/theme/app_colors.dart';

class RaufZerFooter extends StatelessWidget {
  const RaufZerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsData.githubIcon,
            height: AppSizes.iconSizeMedium,
            width: AppSizes.iconSizeMedium,
          ),
          SizedBox(width: AppSpacing.kButtonsSpacingW8),
          Text(
            'raufzer',
            style: AppStyles.headline3.copyWith(
              fontSize: 16.sp,
              color: kTertiaryColor, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
