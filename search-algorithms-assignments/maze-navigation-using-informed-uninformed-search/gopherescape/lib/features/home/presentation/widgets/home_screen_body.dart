import 'package:flutter/material.dart';
import 'package:gopher_escape_app/features/home/presentation/widgets/home_screen_content.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreenContent(),
    );
  }
}