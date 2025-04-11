import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopherescape/features/maze/application/view_models/maze_bloc.dart';
import 'package:gopherescape/features/maze/application/view_models/maze_state.dart';
import 'package:gopherescape/features/maze/presentation/widgets/solved_maze/solved_maze_screen_content.dart';

class SolvedMazeScreenBody extends StatelessWidget {
  const SolvedMazeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MazeBloc, MazeState>(
      builder: (context, state) {
        if (state is MazeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MazeLoaded) {
          return SolvedMazeScreenContent(
            visitedCells: state.visitedCells,
            finalPath: state.finalPath,
            mazeGrid: state.mazeGrid,
            algorithm: state.algorithm,
          );
        } else if (state is MazeError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
