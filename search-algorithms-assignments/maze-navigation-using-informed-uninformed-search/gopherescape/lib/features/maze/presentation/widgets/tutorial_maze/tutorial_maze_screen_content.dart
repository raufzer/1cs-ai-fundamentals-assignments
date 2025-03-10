import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gopherescape/features/maze/presentation/widgets/tutorial_maze/tutorial_maze_grid.dart';
import 'package:gopherescape/shared/widgets/custom_button.dart';
import 'package:gopherescape/shared/widgets/custom_title.dart';
import 'package:gopherescape/shared/widgets/gopher_escape_logo.dart';
import 'package:gopherescape/shared/widgets/raufzer_footer.dart';
import 'package:gopherescape/core/theme/app_sizes.dart';
import 'package:gopherescape/core/theme/app_spacing.dart';
import 'package:gopherescape/core/theme/app_styles.dart';
import 'package:gopherescape/core/theme/app_theme_extension.dart';
import 'package:gopherescape/core/config/app_routes.dart';

class TutorialMazeScreenContent extends StatelessWidget {
  const TutorialMazeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerSize = (screenWidth - (11 * 4.w) - (2 * 16.w)) / 12;
    final theme = Theme.of(context);
    final customTheme = theme.extension<AppThemeExtension>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacing.kLogoTopMargin20),
        const GopherEscapeLogo(),
        SizedBox(height: AppSpacing.kLogoBottomMargin79),
        CustomTitle(title: 'Tutorial Robot Maze'),
        SizedBox(height: AppSpacing.kButtonSpacingH20),

        TutorialMazeGrid(containerSize: containerSize),

        SizedBox(height: AppSpacing.kButtonSpacingH20),

        CustomButton(
          width: AppSizes.secondButtonWidth,
          height: AppSizes.buttonHeight,
          backgroundColor: customTheme!.buttonColor3,
          shadowColor: theme.colorScheme.tertiary,
          borderRadius: AppSizes.buttonBorderRadius,
          text: 'Continue',
          textStyle: AppStyles.headline2,
          textColor: customTheme.additionalColor1,
          onPressed: () {
            context.go(AppRouters.kAlgorithmsScreen);
          },
        ),

        const Spacer(),
        const RaufZerFooter(),
      ],
    );
  }
}
