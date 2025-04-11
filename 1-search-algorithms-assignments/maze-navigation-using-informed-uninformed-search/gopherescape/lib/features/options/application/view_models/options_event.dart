part of 'options_bloc.dart';

abstract class OptionsEvent extends Equatable {
  const OptionsEvent();

  @override
  List<Object?> get props => [];
}

class OptionsButton1Pressed extends OptionsEvent {}

class OptionsButton2Pressed extends OptionsEvent {}

class GenerateRandomMazePressed extends OptionsEvent {}