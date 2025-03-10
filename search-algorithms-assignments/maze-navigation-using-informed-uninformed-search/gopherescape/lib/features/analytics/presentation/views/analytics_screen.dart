import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopherescape/core/utils/maze_solver.dart';
import 'package:gopherescape/features/analytics/application/view_models/results_bloc.dart';
import 'package:gopherescape/features/analytics/application/view_models/results_event.dart';
import 'package:gopherescape/features/analytics/presentation/widgets/analytics_screen_body.dart';

class AnalyticsScreen extends StatelessWidget {
  final String algorithm;

  const AnalyticsScreen({super.key, required this.algorithm});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              AnalyticsBloc(mazeSolver: MazeSolver())
                ..add(FetchAnalyticsEvent(algorithm: algorithm)),
      child: Scaffold(body: AnalyticsScreenBody()),
    );
  }
}
