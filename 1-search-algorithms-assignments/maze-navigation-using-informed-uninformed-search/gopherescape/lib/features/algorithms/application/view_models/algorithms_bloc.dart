import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopherescape/features/algorithms/application/view_models/algorithms_event.dart';
import 'package:gopherescape/features/algorithms/application/view_models/algorithms_state.dart';

class AlgorithmsBloc extends Bloc<AlgorithmsEvent, AlgorithmsState> {
  AlgorithmsBloc() : super(AlgorithmsInitial()) {
    on<LoadAlgorithmsEvent>(_onLoadAlgorithms);
    on<SelectAlgorithmEvent>(_onSelectAlgorithm);
  }

  void _onLoadAlgorithms(
    LoadAlgorithmsEvent event,
    Emitter<AlgorithmsState> emit,
  ) {
    emit(AlgorithmsLoading());
    try {
      emit(AlgorithmsLoaded(selectedButtonIndex: -1));
    } catch (e) {
      emit(AlgorithmsError(message: 'Failed to load algorithms.'));
    }
  }

  void _onSelectAlgorithm(
    SelectAlgorithmEvent event,
    Emitter<AlgorithmsState> emit,
  ) {
    if (state is AlgorithmsLoaded) {
      emit(AlgorithmsLoaded(selectedButtonIndex: event.index));
    }
  }
}
