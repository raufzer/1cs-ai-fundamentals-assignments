import 'package:equatable/equatable.dart';

abstract class MazeEvent extends Equatable {
  const MazeEvent();

  @override
  List<Object> get props => [];
}

class SolveMazeEvent extends MazeEvent {
  final String algorithm;
  final List<List<int>>? customMaze;

  const SolveMazeEvent({required this.algorithm, this.customMaze});

  @override
  List<Object> get props => [algorithm, customMaze ?? []];
}

class GenerateRandomMazeEvent extends MazeEvent {
  get algorithm => null;
}
