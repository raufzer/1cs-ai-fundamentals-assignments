import 'package:flutter/material.dart';
import 'package:gopher_escape_app/core/theme/app_spacing.dart';
import 'package:gopher_escape_app/core/theme/app_theme_extension.dart';
import 'package:gopher_escape_app/shared/widgets/custom_options_button.dart';

class AlgorithmOptionList extends StatefulWidget {
  final Function(int) onButtonSelected;
  final int selectedButtonIndex;

  const AlgorithmOptionList({
    super.key,
    required this.onButtonSelected,
    required this.selectedButtonIndex,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AlgorithmOptionListState createState() => _AlgorithmOptionListState();
}

class _AlgorithmOptionListState extends State<AlgorithmOptionList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<AppThemeExtension>();
    return Column(
      children: [
        OptionButton(
          backgroundColor:
              widget.selectedButtonIndex == 0
                  ? customTheme!.buttonColor2
                  : customTheme!.buttonColor1,
          text: "BFS (Breadth-First)",
          onPressed: () => widget.onButtonSelected(0),
        ),
        SizedBox(height: AppSpacing.kButtonSpacingH16),
        OptionButton(
          backgroundColor:
              widget.selectedButtonIndex == 1
                  ? customTheme.buttonColor2
                  : customTheme.buttonColor1,
          text: 'DFS (Depth-First)',
          onPressed: () => widget.onButtonSelected(1),
        ),
        SizedBox(height: AppSpacing.kButtonSpacingH16),
        OptionButton(
          backgroundColor:
              widget.selectedButtonIndex == 2
                  ? customTheme.buttonColor2
                  : customTheme.buttonColor1,
          text: 'A* (A-Star)',
          onPressed: () => widget.onButtonSelected(2),
        ),
      ],
    );
  }
}
