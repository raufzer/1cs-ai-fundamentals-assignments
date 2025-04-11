import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gopherescape/core/config/app_routes.dart';
import 'package:gopherescape/features/options/application/view_models/options_bloc.dart';
import 'package:gopherescape/features/options/presentation/widgets/options_screen_content.dart';

class OptionsScreenBody extends StatelessWidget {
  const OptionsScreenBody({super.key});

  void _handleSelectPressed(BuildContext context, OptionsState state) {
    if (state.selectedOption == 2) {
      context.go(AppRouters.kMazeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionsBloc, OptionsState>(
      builder: (context, state) {
        return OptionsScreenContent(
          button1Color: state.button1Color,
          button2Color: state.button2Color,
          onButton1Pressed: () {
            context.read<OptionsBloc>().add(OptionsButton1Pressed());
          },
          onButton2Pressed: () {
            context.read<OptionsBloc>().add(OptionsButton2Pressed());
          },
          onSelectPressed: () {
            _handleSelectPressed(context, state);
          },
        );
      },
    );
  }
}
