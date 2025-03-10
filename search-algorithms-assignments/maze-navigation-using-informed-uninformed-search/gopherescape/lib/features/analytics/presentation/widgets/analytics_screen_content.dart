import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gopherescape/core/config/app_routes.dart';
import 'package:gopherescape/core/theme/app_colors.dart';
import 'package:gopherescape/core/theme/app_sizes.dart';
import 'package:gopherescape/core/theme/app_spacing.dart';
import 'package:gopherescape/core/theme/app_styles.dart';
import 'package:gopherescape/features/analytics/presentation/widgets/analytics_results.dart';
import 'package:gopherescape/shared/widgets/custom_button.dart';
import 'package:gopherescape/shared/widgets/gopher_escape_logo.dart';
import 'package:gopherescape/shared/widgets/raufzer_footer.dart';
import 'package:gopherescape/features/analytics/application/view_models/results_state.dart';

class AnalyticsScreenContent extends StatelessWidget {
  final AnalyticsLoaded state;
  const AnalyticsScreenContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacing.kLogoTopMargin20),
        const GopherEscapeLogo(),
        SizedBox(height: AppSpacing.kLogoBottomMargin79),
        AnalyticsResults(
          nodesExplored: state.nodesExplored,
          searchEfficiency: state.searchEfficiency,
          optimalPathLength: state.optimalPathLength,
        ),
        SizedBox(height: 28.11.h),
        CustomButton(
          width: AppSizes.secondButtonWidth,
          height: AppSizes.buttonHeight,
          backgroundColor: kButtonColor3,
          shadowColor: Colors.black,
          borderRadius: AppSizes.buttonBorderRadius,
          text: 'Try Again',
          textStyle: AppStyles.headline2,
          textColor: kAdditionalColor1,
          onPressed: () {
            context.go(AppRouters.kOptionsScreen);
          },
        ),
        const Spacer(),
        const RaufZerFooter(),
      ],
    );
  }
}
