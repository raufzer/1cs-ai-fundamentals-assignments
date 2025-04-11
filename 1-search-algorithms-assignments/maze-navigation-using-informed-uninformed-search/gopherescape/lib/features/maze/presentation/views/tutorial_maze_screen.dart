import 'package:flutter/material.dart';
import 'package:gopherescape/features/maze/presentation/widgets/tutorial_maze/tutorial_maze_screen_content.dart';

class TutorialMazeScreen extends StatelessWidget {
  const TutorialMazeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TutorialMazeScreenContent());
  }
}
