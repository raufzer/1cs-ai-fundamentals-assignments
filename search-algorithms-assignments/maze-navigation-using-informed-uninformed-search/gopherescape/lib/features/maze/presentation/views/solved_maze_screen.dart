import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopher_escape_app/features/maze/application/view_models/maze_bloc.dart';
import 'package:gopher_escape_app/features/maze/application/view_models/maze_event.dart';
import 'package:gopher_escape_app/features/maze/presentation/widgets/solved_maze/sovled_maze_screen_body.dart';

class SolvedMazeScreen extends StatelessWidget {
  final String algorithm;
  final List<List<int>>? randomMaze;

  const SolvedMazeScreen({super.key, required this.algorithm, this.randomMaze});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              MazeBloc()..add(
                SolveMazeEvent(algorithm: algorithm, customMaze: randomMaze),
              ),
      child: Scaffold(body: SolvedMazeScreenBody()),
    );
  }
}
