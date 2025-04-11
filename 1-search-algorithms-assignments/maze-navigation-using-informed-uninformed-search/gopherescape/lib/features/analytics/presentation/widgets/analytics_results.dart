import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopherescape/core/theme/app_sizes.dart';
import 'package:gopherescape/core/theme/app_spacing.dart';
import 'package:gopherescape/core/theme/app_styles.dart';
import 'package:gopherescape/core/theme/app_theme_extension.dart';
import 'package:gopherescape/features/analytics/presentation/widgets/result_button.dart';

class AnalyticsResults extends StatelessWidget {
  final int nodesExplored;
  final double searchEfficiency;
  final int optimalPathLength;

  const AnalyticsResults({
    super.key,
    required this.nodesExplored,
    required this.searchEfficiency,
    required this.optimalPathLength,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<AppThemeExtension>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResultButton(
          width: AppSizes.thirdButtonWidth,
          height: AppSizes.thirdButtonHeight,
          backgroundColor: customTheme!.buttonColor6,
          shadowColor: theme.colorScheme.tertiary,
          borderRadius: 30.r,
          title: 'Nodes Explored',
          subtitle: 'Total: $nodesExplored nodes',
          titleStyle: AppStyles.headline2,
          subtitleStyle: AppStyles.bodyText2,
          textColor: customTheme.additionalColor1,
          onPressed: () {},
        ),
        SizedBox(height: AppSpacing.kButtonSpacingH16),
        ResultButton(
          width: AppSizes.thirdButtonWidth,
          height: AppSizes.thirdButtonHeight,
          backgroundColor: customTheme.buttonColor4,
          shadowColor: theme.colorScheme.tertiary,
          borderRadius: 30.r,
          title: 'Search Efficiency',
          subtitle: 'Efficiency: $searchEfficiency%',
          titleStyle: AppStyles.headline2,
          subtitleStyle: AppStyles.bodyText2,
          textColor: customTheme.additionalColor1,
          onPressed: () {},
        ),
        SizedBox(height: AppSpacing.kButtonSpacingH16),
        ResultButton(
          width: AppSizes.thirdButtonWidth,
          height: AppSizes.thirdButtonHeight,
          backgroundColor: customTheme.buttonColor5,
          shadowColor: theme.colorScheme.tertiary,
          borderRadius: 30.r,
          title: 'Optimal Path',
          subtitle: 'Path Length: $optimalPathLength steps',
          titleStyle: AppStyles.headline2,
          subtitleStyle: AppStyles.bodyText2,
          textColor: customTheme.additionalColor1,
          onPressed: () {},
        ),
      ],
    );
  }
}