import 'package:equatable/equatable.dart';

abstract class MazeState extends Equatable {
  const MazeState();

  @override
  List<Object> get props => [];
}

class MazeInitial extends MazeState {}

class MazeLoading extends MazeState {}

class MazeLoaded extends MazeState {
  final List<List<int>> visitedCells;
  final List<List<int>> finalPath;
  final List<List<int>> mazeGrid;
  final String algorithm;

  const MazeLoaded({
    required this.visitedCells,
    required this.finalPath,
    required this.mazeGrid,
    required searchEfficiency,
    required nodesExplored,
    required optimalPathLength,
    required this.algorithm,
  });

  @override
  List<Object> get props => [visitedCells, finalPath, mazeGrid];
}

class MazeError extends MazeState {
  final String message;

  const MazeError({required this.message});

  @override
  List<Object> get props => [message];
}
