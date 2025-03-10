import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gopherescape/features/algorithms/presentation/views/algorithms_screen.dart';
import 'package:gopherescape/features/analytics/presentation/views/analytics_screen.dart';
import 'package:gopherescape/features/home/presentation/views/home_screen.dart';
import 'package:gopherescape/features/maze/presentation/views/solved_maze_screen.dart';
import 'package:gopherescape/features/maze/presentation/views/tutorial_maze_screen.dart';
import 'package:gopherescape/features/options/presentation/views/options_screen.dart';

abstract class AppRouters {
  static const kHomeScreen = '/homeScreen';
  static const kOptionsScreen = '/optionsScreen';
  static const kMazeScreen = '/mazeScreen';
  static const kAlgorithmsScreen = '/algorithmsScreen';
  static const kSolvedMazeScreen = '/solvedMazeScreen';
  static const kAnalyticsScreen = '/analyticsScreen';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: kOptionsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OptionsScreen();
        },
      ),
      GoRoute(
        path: kMazeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const TutorialMazeScreen();
        },
      ),
      GoRoute(
        path: kAlgorithmsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AlgorithmsScreen();
        },
      ),
      GoRoute(
        path: kSolvedMazeScreen,
        builder: (BuildContext context, GoRouterState state) {
          final algorithm = state.uri.queryParameters['algorithm'] ?? 'dfs';
          return SolvedMazeScreen(algorithm: algorithm);
        },
      ),
      GoRoute(
        path: kAnalyticsScreen,
        builder: (BuildContext context, GoRouterState state) {
          final algorithm = state.uri.queryParameters['algorithm'];
          // Debugging line
          return AnalyticsScreen(algorithm: algorithm ?? 'dfs');
        },
      ),
    ],
  );
}
