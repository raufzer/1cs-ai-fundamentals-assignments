import 'package:flutter/material.dart';
import 'package:gopherescape/shared/widgets/custom_button.dart';
import 'package:gopherescape/shared/widgets/custom_title.dart';
import 'package:gopherescape/shared/widgets/gopher_escape_logo.dart';
import 'package:gopherescape/shared/widgets/raufzer_footer.dart';
import 'package:gopherescape/core/theme/app_sizes.dart';
import 'package:gopherescape/core/theme/app_spacing.dart';
import 'package:gopherescape/core/theme/app_styles.dart';
import 'package:gopherescape/core/theme/app_theme_extension.dart';
import 'package:gopherescape/features/algorithms/presentation/widgets/algorithms_options_list.dart';

class AlgorithmsScreenContent extends StatelessWidget {
  final int selectedButtonIndex;
  final Function(int) onButtonSelected;
  final VoidCallback onButtonPressed;

  const AlgorithmsScreenContent({
    super.key,
    required this.selectedButtonIndex,
    required this.onButtonSelected,
    required this.onButtonPressed,
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
        CustomTitle(title: 'Select a Search Algorithm'),
        SizedBox(height: AppSpacing.kButtonSpacingH22),
        AlgorithmOptionList(
          onButtonSelected: onButtonSelected,
          selectedButtonIndex: selectedButtonIndex,
        ),
        SizedBox(height: AppSpacing.kButtonSpacingH16),
        CustomButton(
          width: AppSizes.secondButtonWidth,
          height: AppSizes.buttonHeight,
          backgroundColor: customTheme!.buttonColor3,
          shadowColor: theme.colorScheme.tertiary,
          borderRadius: AppSizes.buttonBorderRadius,
          text: 'Start Search',
          textStyle: AppStyles.headline2,
          textColor: customTheme.additionalColor1,
          onPressed: onButtonPressed,
        ),
        const Spacer(),
        const RaufZerFooter(),
      ],
    );
  }
}
