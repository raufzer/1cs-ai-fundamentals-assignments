import 'package:flutter/material.dart';
import 'package:gopherescape/shared/widgets/custom_button.dart';

class ResultButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color shadowColor;
  final double borderRadius;
  final String title;
  final String subtitle;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final Color textColor;
  final VoidCallback onPressed;

  const ResultButton({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.shadowColor,
    required this.borderRadius,
    required this.title,
    required this.subtitle,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      onPressed: onPressed,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n',
              style: titleStyle.copyWith(color: textColor),
            ),
            TextSpan(
              text: subtitle,
              style: subtitleStyle.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
