import 'package:flutter/material.dart';
import 'package:gopher_escape_app/shared/widgets/custom_button.dart';
import 'package:gopher_escape_app/shared/widgets/gopher_escape_logo.dart';
import 'package:gopher_escape_app/shared/widgets/raufzer_footer.dart';
import 'package:gopher_escape_app/core/theme/app_sizes.dart';
import 'package:gopher_escape_app/core/theme/app_spacing.dart';
import 'package:gopher_escape_app/core/theme/app_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:gopher_escape_app/core/config/app_routes.dart';
import 'package:gopher_escape_app/core/theme/app_theme_extension.dart';
import 'package:gopher_escape_app/features/home/presentation/widgets/gopher_avatar.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  void _onButtonPressed(BuildContext context) {
    context.go(AppRouters.kOptionsScreen);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<AppThemeExtension>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacing.kLogoTopMargin95),
        const GopherEscapeLogo(),
        SizedBox(height: AppSpacing.kAvatarTopMargin50),
        const GopherAvatar(),
        SizedBox(height: AppSpacing.kAvatarTopMargin50),
        CustomButton(
          width: AppSizes.mainButtonWidth,
          height: AppSizes.buttonHeight,
          backgroundColor: customTheme!.buttonColor3,
          shadowColor: theme.colorScheme.tertiary,
          borderRadius: AppSizes.buttonBorderRadius,
          text: 'Start',
          textStyle: AppStyles.headline1,
          textColor: customTheme.additionalColor1,
          onPressed: () => _onButtonPressed(context),
        ),
        Spacer(),
        const RaufZerFooter(),
      ],
    );
  }
}
