import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  // Font Weights
  static FontWeight black = FontWeight.w900;
  static FontWeight bold = FontWeight.w700;
  static FontWeight medium = FontWeight.w500;
  static FontWeight regular = FontWeight.w400;
  static const kInter = 'Inter';

  // Text Styles
  static TextStyle get headline1 => TextStyle(
        fontSize: 30.sp,
        fontFamily: kInter,
        fontWeight: black,
      );

  static TextStyle get headline2 => TextStyle(
        fontSize: 18.sp,
        fontFamily: kInter,
        fontWeight: black,
      );

  static TextStyle get headline3 => TextStyle(
        fontSize: 18.sp,
        fontFamily: kInter,
        fontWeight: bold,
      );

  static TextStyle get bodyText1 => TextStyle(
        fontSize: 18.sp,
        fontFamily: kInter,
        fontWeight: regular,
      );

  static TextStyle get bodyText2 => TextStyle(
        fontSize: 18.sp,
        fontFamily: kInter,
        fontWeight: medium,
      );
}
