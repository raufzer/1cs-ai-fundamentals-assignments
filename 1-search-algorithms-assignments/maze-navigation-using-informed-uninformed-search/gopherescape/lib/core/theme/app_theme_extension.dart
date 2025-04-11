import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color additionalColor1;
  final Color additionalColor2;
  final Color accentColor1;
  final Color accentColor2;
  final Color accentColor3;
  final Color accentColor4;
  final Color accentColor5;
  final Color buttonColor1;
  final Color buttonColor2;
  final Color buttonColor3;
  final Color buttonColor4;
  final Color buttonColor5;
  final Color buttonColor6;

  const AppThemeExtension({
    required this.additionalColor1,
    required this.additionalColor2,
    required this.accentColor1,
    required this.accentColor2,
    required this.accentColor3,
    required this.accentColor4,
    required this.accentColor5,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.buttonColor3,
    required this.buttonColor4,
    required this.buttonColor5,
    required this.buttonColor6,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? additionalColor1,
    Color? additionalColor2,
    Color? accentColor1,
    Color? accentColor2,
    Color? accentColor3,
    Color? accentColor4,
    Color? accentColor5,
    Color? buttonColor1,
    Color? buttonColor2,
    Color? buttonColor3,
    Color? buttonColor4,
    Color? buttonColor5,
    Color? buttonColor6,
  }) {
    return AppThemeExtension(
      additionalColor1: additionalColor1 ?? this.additionalColor1,
      additionalColor2: additionalColor2 ?? this.additionalColor2,
      accentColor1: accentColor1 ?? this.accentColor1,
      accentColor2: accentColor2 ?? this.accentColor2,
      accentColor3: accentColor3 ?? this.accentColor3,
      accentColor4: accentColor4 ?? this.accentColor4,
      accentColor5: accentColor5 ?? this.accentColor5,
      buttonColor1: buttonColor1 ?? this.buttonColor1,
      buttonColor2: buttonColor2 ?? this.buttonColor2,
      buttonColor3: buttonColor3 ?? this.buttonColor3,
      buttonColor4: buttonColor4 ?? this.buttonColor4,
      buttonColor5: buttonColor5 ?? this.buttonColor5,
      buttonColor6: buttonColor6 ?? this.buttonColor6,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      additionalColor1:
          Color.lerp(additionalColor1, other.additionalColor1, t)!,
      additionalColor2:
          Color.lerp(additionalColor2, other.additionalColor2, t)!,
      accentColor1: Color.lerp(accentColor1, other.accentColor1, t)!,
      accentColor2: Color.lerp(accentColor2, other.accentColor2, t)!,
      accentColor3: Color.lerp(accentColor3, other.accentColor3, t)!,
      accentColor4: Color.lerp(accentColor4, other.accentColor4, t)!,
      accentColor5: Color.lerp(accentColor5, other.accentColor5, t)!,
      buttonColor1: Color.lerp(buttonColor1, other.buttonColor1, t)!,
      buttonColor2: Color.lerp(buttonColor2, other.buttonColor2, t)!,
      buttonColor3: Color.lerp(buttonColor3, other.buttonColor3, t)!,
      buttonColor4: Color.lerp(buttonColor4, other.buttonColor4, t)!,
      buttonColor5: Color.lerp(buttonColor5, other.buttonColor5, t)!,
      buttonColor6: Color.lerp(buttonColor6, other.buttonColor6, t)!,
    );
  }
}
