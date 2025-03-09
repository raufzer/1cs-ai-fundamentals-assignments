import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopher_escape_app/features/options/application/view_models/options_bloc.dart';
import 'package:gopher_escape_app/features/options/presentation/widgets/options_screen_body.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OptionsBloc(),
      child: Scaffold(body: OptionsScreenBody()),
    );
  }
}
