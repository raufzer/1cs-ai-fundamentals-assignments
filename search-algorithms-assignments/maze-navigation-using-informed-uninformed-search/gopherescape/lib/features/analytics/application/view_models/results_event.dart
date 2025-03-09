import 'package:equatable/equatable.dart';

abstract class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  @override
  List<Object> get props => [];
}

enum SearchAlgorithm { dfs, bfs }

class FetchAnalyticsEvent extends AnalyticsEvent {
  final String algorithm;

  const FetchAnalyticsEvent({
    required this.algorithm,
  });

  get customMaze => null;
}
