import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gopher_escape_app/core/config/app_routes.dart';
import 'package:gopher_escape_app/features/maze/presentation/widgets/solved_maze/maze_animation.dart';
import 'package:gopher_escape_app/features/maze/presentation/widgets/solved_maze/maze_grid.dart';
import 'package:gopher_escape_app/shared/widgets/custom_button.dart';
import 'package:gopher_escape_app/shared/widgets/custom_title.dart';
import 'package:gopher_escape_app/shared/widgets/gopher_escape_logo.dart';
import 'package:gopher_escape_app/shared/widgets/raufzer_footer.dart';
import 'package:gopher_escape_app/core/theme/app_sizes.dart';
import 'package:gopher_escape_app/core/theme/app_spacing.dart';
import 'package:gopher_escape_app/core/theme/app_styles.dart';
import 'package:gopher_escape_app/core/theme/app_theme_extension.dart';

class SolvedMazeScreenContent extends StatefulWidget {
  final List<List<int>> visitedCells;
  final List<List<int>> finalPath;
  final List<List<int>> mazeGrid;
  final String algorithm;

  const SolvedMazeScreenContent({
    super.key,
    required this.visitedCells,
    required this.finalPath,
    required this.mazeGrid,
    required this.algorithm,
  });

  @override
  State<SolvedMazeScreenContent> createState() =>
      _SolvedMazeScreenContentState();
}

class _SolvedMazeScreenContentState extends State<SolvedMazeScreenContent>
    with MazeAnimations<SolvedMazeScreenContent> {
  String titleText = "Exploring...";
  String? subtitleText;
  @override
  void initState() {
    super.initState();
    startVisitedAnimation(widget.visitedCells, () => setState(() {}));
  }

  void updateTitleForVisited() {
    setState(() {
      titleText = "Exploring...";
    });
  }

  @override
  void prepareForPathAnimation(VoidCallback updateState) {
    super.prepareForPathAnimation(() {
      setState(() {
        titleText = "Solution Discovered:";
        subtitleText = "Optimal Path Highlighted";
      });
      updateState();
    });

    if (widget.finalPath.isNotEmpty) {
      startFinalPathAnimation(widget.finalPath, () => setState(() {}));
    }
  }

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
        CustomTitle(title: titleText, subtitle: subtitleText),
        SizedBox(height: AppSpacing.kButtonSpacingH20),
        MazeGrid(
          visitedCells: widget.visitedCells,
          finalPath: widget.finalPath,
          mazeGrid: widget.mazeGrid,
          visitedAnimationIndex: visitedAnimationIndex,
          finalPathAnimationIndex: finalPathAnimationIndex,
          showingVisited: showingVisited,
          showingFinalPath: showingFinalPath,
        ),

        SizedBox(height: AppSpacing.kButtonSpacingH20),

        if (showingFinalPath)
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
              context.go(
                '${AppRouters.kAnalyticsScreen}?algorithm=${widget.algorithm}',
              );
            },
          ),

        const Spacer(),
        const RaufZerFooter(),
      ],
    );
  }
}
