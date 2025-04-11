import 'package:equatable/equatable.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object> get props => [];
}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final int nodesExplored;
  final double searchEfficiency;
  final int optimalPathLength;

  const AnalyticsLoaded({
    required this.nodesExplored,
    required this.searchEfficiency,
    required this.optimalPathLength,
  });

  @override
  List<Object> get props => [nodesExplored, searchEfficiency, optimalPathLength];
}

class AnalyticsError extends AnalyticsState {
  final String message;

  const AnalyticsError({required this.message});

  @override
  List<Object> get props => [message];
}