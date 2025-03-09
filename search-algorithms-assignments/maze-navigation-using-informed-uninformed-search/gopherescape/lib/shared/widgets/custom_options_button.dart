import 'package:flutter/material.dart';

import 'package:gopher_escape_app/core/theme/app_colors.dart';
import 'package:gopher_escape_app/core/theme/app_sizes.dart';
import 'package:gopher_escape_app/core/theme/app_styles.dart';
import 'package:gopher_escape_app/shared/widgets/custom_button.dart';

class OptionButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomButton(
      width: AppSizes.mainButtonWidth,
      height: AppSizes.buttonHeight,
      backgroundColor: backgroundColor,
      shadowColor: theme.colorScheme.tertiary,
      borderRadius: AppSizes.buttonBorderRadius,
      text: text,
      textStyle: AppStyles.headline2,
      textColor: kAdditionalColor1,
      onPressed: onPressed,
    );
  }
}
