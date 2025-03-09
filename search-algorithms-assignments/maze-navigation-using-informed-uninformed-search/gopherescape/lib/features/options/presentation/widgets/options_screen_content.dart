import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher_escape_app/shared/widgets/custom_button.dart';
import 'package:gopher_escape_app/shared/widgets/custom_title.dart';
import 'package:gopher_escape_app/shared/widgets/gopher_escape_logo.dart';
import 'package:gopher_escape_app/shared/widgets/raufzer_footer.dart';
import 'package:gopher_escape_app/core/theme/app_colors.dart';
import 'package:gopher_escape_app/core/theme/app_sizes.dart';
import 'package:gopher_escape_app/core/theme/app_spacing.dart';
import 'package:gopher_escape_app/core/theme/app_styles.dart';
import 'package:gopher_escape_app/core/theme/app_theme_extension.dart';
import 'package:gopher_escape_app/features/options/presentation/widgets/option_buttons.dart';

class OptionsScreenContent extends StatelessWidget {
  final Color button1Color;
  final Color button2Color;
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;
  final VoidCallback onSelectPressed;

  const OptionsScreenContent({
    super.key,
    required this.button1Color,
    required this.button2Color,
    required this.onButton1Pressed,
    required this.onButton2Pressed,
    required this.onSelectPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<AppThemeExtension>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacing.kLogoTopMargin20),
        const GopherEscapeLogo(),
        SizedBox(height: AppSpacing.kLogoBottomMargin79),
        CustomTitle(title: 'Choose An Option'),
        SizedBox(height: 56.h),
        OptionButtons(
          button1Color: button1Color,
          button2Color: button2Color,
          onButton1Pressed: onButton1Pressed,
          onButton2Pressed: onButton2Pressed,
        ),
        SizedBox(height: 66.h),
        CustomButton(
          width: AppSizes.secondButtonWidth,
          height: AppSizes.buttonHeight,
          backgroundColor: customTheme!.buttonColor3,
          shadowColor:theme.colorScheme.tertiary,
          borderRadius: AppSizes.buttonBorderRadius,
          text: 'Select',
          textStyle: AppStyles.headline2,
          textColor: kAdditionalColor1,
          onPressed: onSelectPressed,
        ),

        const Spacer(),
        const RaufZerFooter(),
      ],
    );
  }
}
