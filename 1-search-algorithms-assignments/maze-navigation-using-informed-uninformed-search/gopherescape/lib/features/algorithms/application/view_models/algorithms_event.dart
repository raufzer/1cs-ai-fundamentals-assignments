import 'package:equatable/equatable.dart';

abstract class AlgorithmsEvent extends Equatable {
  const AlgorithmsEvent();

  @override
  List<Object> get props => [];
}

class LoadAlgorithmsEvent extends AlgorithmsEvent {}

class SelectAlgorithmEvent extends AlgorithmsEvent {
  final int index;

  const SelectAlgorithmEvent({required this.index});

  @override
  List<Object> get props => [index];
}