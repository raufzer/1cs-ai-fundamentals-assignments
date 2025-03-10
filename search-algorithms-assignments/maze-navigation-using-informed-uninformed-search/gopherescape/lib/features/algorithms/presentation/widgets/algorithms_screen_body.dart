import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gopherescape/core/config/app_routes.dart';
import 'package:gopherescape/features/algorithms/application/view_models/algorithms_bloc.dart';
import 'package:gopherescape/features/algorithms/application/view_models/algorithms_event.dart';
import 'package:gopherescape/features/algorithms/application/view_models/algorithms_state.dart';
import 'package:gopherescape/features/algorithms/presentation/widgets/algorithms_screen_content.dart';

class AlgorithmsScreenBody extends StatelessWidget {
  const AlgorithmsScreenBody({super.key});

  void _onButtonPressed(BuildContext context, int selectedButtonIndex) {
    
    String algorithm;
    if (selectedButtonIndex == 0) {
      algorithm = 'bfs';
    } else if (selectedButtonIndex == 1) {
      algorithm = 'dfs';
    } else {
      algorithm = 'astar';
    }

    context.go('${AppRouters.kSolvedMazeScreen}?algorithm=$algorithm');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlgorithmsBloc, AlgorithmsState>(
      builder: (context, state) {
        if (state is AlgorithmsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AlgorithmsLoaded) {
          return AlgorithmsScreenContent(
            selectedButtonIndex: state.selectedButtonIndex,
            onButtonSelected: (index) {
              context.read<AlgorithmsBloc>().add(SelectAlgorithmEvent(index: index));
            },
            onButtonPressed: () => _onButtonPressed(context, state.selectedButtonIndex),
          );
        } else if (state is AlgorithmsError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }
}