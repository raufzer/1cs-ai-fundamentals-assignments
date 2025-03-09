import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopher_escape_app/core/theme/app_colors.dart';

part 'options_event.dart';
part 'options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {
  OptionsBloc() : super(const OptionsInitial()) {
    on<OptionsButton1Pressed>(_onButton1Pressed);
    on<OptionsButton2Pressed>(_onButton2Pressed);
    on<GenerateRandomMazePressed>(_onGenerateRandomMazePressed);
  }

  void _onButton1Pressed(
    OptionsButton1Pressed event,
    Emitter<OptionsState> emit,
  ) {
    emit(
      state.copyWith(
        button1Color: kButtonColor2,
        button2Color: kButtonColor1,
        selectedOption: 1,
      ),
    );
  }

  void _onButton2Pressed(
    OptionsButton2Pressed event,
    Emitter<OptionsState> emit,
  ) {
    emit(
      state.copyWith(
        button1Color: kButtonColor1,
        button2Color: kButtonColor2,
        selectedOption: 2,
      ),
    );
  }

  void _onGenerateRandomMazePressed(
    GenerateRandomMazePressed event,
    Emitter<OptionsState> emit,
  ) {
    List<List<int>> randomMaze = _generateRandomMaze(8, 12);
    emit(state.copyWith(randomMaze: randomMaze, selectedOption: 2));
  }

  List<List<int>> _generateRandomMaze(int rows, int cols) {
    Random random = Random();
    List<List<int>> maze = List.generate(
      rows,
      (_) => List.generate(cols, (_) => random.nextInt(2)),
    );
    maze[7][0] = 0;
    maze[0][11] = 0;
    return maze;
  }
}
