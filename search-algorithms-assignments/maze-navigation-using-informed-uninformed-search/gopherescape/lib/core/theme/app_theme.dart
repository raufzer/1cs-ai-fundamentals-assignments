import 'package:flutter/material.dart';
import 'package:gopherescape/core/theme/app_theme_extension.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kPrimaryColor,
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        tertiary: kTertiaryColor,
      ),
      textTheme: TextTheme(
        displayLarge: AppStyles.headline1,
        displayMedium: AppStyles.headline2,
        displaySmall: AppStyles.headline3,
        bodyLarge: AppStyles.bodyText1,
        bodyMedium: AppStyles.bodyText2,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppThemeExtension(
          additionalColor1: kAdditionalColor1,
          additionalColor2: kAdditionalColor2,
          accentColor1: kAccentColor1,
          accentColor2: kAccentColor2,
          accentColor3: kAccentColor3,
          accentColor4: kAccentColor4,
          accentColor5: kAccentColor5,
          buttonColor1: kButtonColor1,
          buttonColor2: kButtonColor2,
          buttonColor3: kButtonColor3,
          buttonColor4: kButtonColor4,
          buttonColor5: kButtonColor5,
          buttonColor6: kButtonColor6,
        ),
      ],
    );
  }
}
