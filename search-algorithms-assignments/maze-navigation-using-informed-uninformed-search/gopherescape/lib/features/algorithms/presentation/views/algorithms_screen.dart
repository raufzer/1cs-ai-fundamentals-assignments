import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopher_escape_app/features/algorithms/application/view_models/algorithms_bloc.dart';
import 'package:gopher_escape_app/features/algorithms/application/view_models/algorithms_event.dart';
import 'package:gopher_escape_app/features/algorithms/presentation/widgets/algorithms_screen_body.dart';

class AlgorithmsScreen extends StatelessWidget {
  const AlgorithmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlgorithmsBloc()..add(LoadAlgorithmsEvent()),
      child: Scaffold(
        body: AlgorithmsScreenBody(),
      ),
    );
  }
}