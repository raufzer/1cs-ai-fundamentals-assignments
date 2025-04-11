import 'package:equatable/equatable.dart';

abstract class AlgorithmsState extends Equatable {
  const AlgorithmsState();

  @override
  List<Object> get props => [];
}

class AlgorithmsInitial extends AlgorithmsState {}

class AlgorithmsLoading extends AlgorithmsState {}

class AlgorithmsLoaded extends AlgorithmsState {
  final int selectedButtonIndex;

  const AlgorithmsLoaded({required this.selectedButtonIndex});

  @override
  List<Object> get props => [selectedButtonIndex];
}

class AlgorithmsError extends AlgorithmsState {
  final String message;

  const AlgorithmsError({required this.message});

  @override
  List<Object> get props => [message];
}