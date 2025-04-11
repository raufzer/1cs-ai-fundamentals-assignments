import 'package:flutter/material.dart';
import 'package:gopherescape/core/theme/app_sizes.dart';
import 'package:gopherescape/core/utils/app_assets.dart';

class GopherEscapeLogo extends StatelessWidget {
  const GopherEscapeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.gopherEscape,
        height: AppSizes.logoHeight,
        width: AppSizes.logoWidth,
      ),
    );
  }
}
