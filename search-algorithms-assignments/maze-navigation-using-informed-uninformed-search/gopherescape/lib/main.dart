import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopherescape/core/config/app_routes.dart';
import 'package:gopherescape/core/theme/app_colors.dart';
import 'package:gopherescape/core/theme/app_theme.dart';

void main() {
    FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kSecondaryColor),
  );
  runApp(GopherEscapeApp());
}

class GopherEscapeApp extends StatelessWidget {
  const GopherEscapeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'GopherEscape',
          routerConfig: AppRouters.router,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
