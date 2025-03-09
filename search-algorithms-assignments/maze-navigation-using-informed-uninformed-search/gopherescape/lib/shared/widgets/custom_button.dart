import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color shadowColor;
  final double borderRadius;
  final String? text;
  final TextStyle? textStyle;
  final Color? textColor;
  final VoidCallback onPressed;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.shadowColor,
    required this.borderRadius,
    this.text,
    this.textStyle,
    this.textColor,
    required this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width .w,
          height: height .h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius .r),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: shadowColor.withOpacity(0.15),
                offset: const Offset(-5, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child:
                child ??
                Text(text!, style: textStyle!.copyWith(color: textColor)),
          ),
        ),
      ),
    );
  }
}
