import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopherescape/features/analytics/application/view_models/results_event.dart';
import 'package:gopherescape/features/analytics/application/view_models/results_state.dart';
import 'package:gopherescape/core/utils/maze_solver.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final MazeSolver mazeSolver;

  AnalyticsBloc({required this.mazeSolver}) : super(AnalyticsInitial()) {
    on<FetchAnalyticsEvent>(_onFetchAnalytics);
  }

  Future<void> _onFetchAnalytics(
    FetchAnalyticsEvent event,
    Emitter<AnalyticsState> emit,
  ) async {
    emit(AnalyticsLoading());

    try {
      final mazeGrid = event.customMaze ?? MazeSolver.buildGrid();
      final start = [7, 0];
      final goal = [0, 11];

      Map<String, dynamic> result;
      switch (event.algorithm.toLowerCase()) {
        case 'dfs':
          result = MazeSolver.solveDFS(grid: mazeGrid, start: start, goal: goal);
          break;
        case 'bfs':
          result = MazeSolver.solveBFS(grid: mazeGrid, start: start, goal: goal);
          break;
        default:
          throw Exception("Invalid algorithm: ${event.algorithm}");
      }
      emit(
        AnalyticsLoaded(
          nodesExplored: result['nodesExplored'] ?? 0,
          searchEfficiency: result['searchEfficiency'] ?? 0.0,
          optimalPathLength: result['optimalPathLength'] ?? 0,
        ),
      );
    } catch (e) {
      emit(AnalyticsError(message: 'Failed to fetch analytics data.'));
    }
  }
}