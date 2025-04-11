import 'package:flutter/material.dart';
import 'package:gopherescape/shared/widgets/custom_options_button.dart';
import 'package:gopherescape/core/theme/app_spacing.dart';

class OptionButtons extends StatelessWidget {
  final Color button1Color;
  final Color button2Color;
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;

  const OptionButtons({
    super.key,
    required this.button1Color,
    required this.button2Color,
    required this.onButton1Pressed,
    required this.onButton2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionButton(
          backgroundColor: button1Color,
          text: 'Build Your Own Maze',
          onPressed: onButton1Pressed,
        ),
        SizedBox(height: AppSpacing.kButtonSpacingH16),
        OptionButton(
          backgroundColor: button2Color,
          text: 'Use Tutorial Robot Maze',
          onPressed: onButton2Pressed,
        ),
      ],
    );
  }
}
