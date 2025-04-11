import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopherescape/core/utils/maze_solver.dart';
import 'package:gopherescape/features/maze/application/view_models/maze_event.dart';
import 'package:gopherescape/features/maze/application/view_models/maze_state.dart';

class MazeBloc extends Bloc<MazeEvent, MazeState> {
  MazeBloc() : super(MazeInitial()) {
    on<SolveMazeEvent>(_onSolveMaze);
    on<GenerateRandomMazeEvent>(_onGenerateRandomMaze);
  }

  Future<void> _onSolveMaze(
    SolveMazeEvent event,
    Emitter<MazeState> emit,
  ) async {
    emit(MazeLoading());

    try {
      final mazeGrid = event.customMaze ?? MazeSolver.buildGrid();
      final start = [7, 0];
      final goal = [0, 11];

      Map<String, dynamic> result;
      if (event.algorithm == 'dfs') {
        result = MazeSolver.solveDFS(grid: mazeGrid, start: start, goal: goal);
      } else if (event.algorithm == 'bfs') {
        result = MazeSolver.solveBFS(grid: mazeGrid, start: start, goal: goal);
      } else {
        result = MazeSolver.solveDFS(grid: mazeGrid, start: start, goal: goal);
      }

      emit(
        MazeLoaded(
          visitedCells: result['visited']!,
          finalPath: result['path']!,
          mazeGrid: mazeGrid,
          nodesExplored: result['nodesExplored'],
          searchEfficiency: result['searchEfficiency'],
          optimalPathLength: result['optimalPathLength'],
          algorithm: event.algorithm,
        ),
      );
    } catch (e) {
      emit(MazeError(message: 'Failed to solve the maze.'));
    }
  }

  Future<void> _onGenerateRandomMaze(
    GenerateRandomMazeEvent event,
    Emitter<MazeState> emit,
  ) async {
    emit(MazeLoading());

    try {
      final randomMaze = _generateRandomMaze(8, 12);
      final start = [7, 0];
      final goal = [0, 11];

      final result = MazeSolver.solveDFS(
        grid: randomMaze,
        start: start,
        goal: goal,
      );

      emit(
        MazeLoaded(
          visitedCells: result['visited']!,
          finalPath: result['path']!,
          mazeGrid: randomMaze,
          nodesExplored: result['nodesExplored'],
          searchEfficiency: result['searchEfficiency'],
          optimalPathLength: result['optimalPathLength'],
          algorithm: event.algorithm,
        ),
      );
    } catch (e) {
      emit(MazeError(message: 'Failed to generate a random maze.'));
    }
  }

  List<List<int>> _generateRandomMaze(int rows, int cols) {
    Random random = Random();
    List<List<int>> maze = List.generate(
      rows,
      (_) => List.generate(cols, (_) => random.nextInt(2)),
    );
    maze[7][0] = 0; // Start point
    maze[0][11] = 0; // End point
    return maze;
  }
}
