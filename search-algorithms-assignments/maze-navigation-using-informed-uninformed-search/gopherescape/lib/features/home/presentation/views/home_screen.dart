import 'package:flutter/material.dart';
import 'package:gopherescape/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreenBody());
  }
}