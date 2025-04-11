import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopherescape/features/options/application/view_models/options_bloc.dart';
import 'package:gopherescape/features/options/presentation/widgets/options_screen_body.dart';

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
