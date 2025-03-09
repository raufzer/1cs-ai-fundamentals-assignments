part of 'options_bloc.dart';

class OptionsState extends Equatable {
  final Color button1Color;
  final Color button2Color;
  final int selectedOption;
  final List<List<int>>? randomMaze;

  const OptionsState({
    required this.button1Color,
    required this.button2Color,
    required this.selectedOption,
    this.randomMaze,
  });

  OptionsState copyWith({
    Color? button1Color,
    Color? button2Color,
    int? selectedOption,
    List<List<int>>? randomMaze,
  }) {
    return OptionsState(
      button1Color: button1Color ?? this.button1Color,
      button2Color: button2Color ?? this.button2Color,
      selectedOption: selectedOption ?? this.selectedOption,
      randomMaze: randomMaze ?? this.randomMaze,
    );
  }

  @override
  List<Object?> get props => [button1Color, button2Color, selectedOption, randomMaze];
}

class OptionsInitial extends OptionsState {
  const OptionsInitial()
    : super(
        button1Color: kButtonColor1,
        button2Color: kButtonColor1,
        selectedOption: 0,
      );
}