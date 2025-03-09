import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gopher_escape_app/features/analytics/application/view_models/results_bloc.dart';
import 'package:gopher_escape_app/features/analytics/application/view_models/results_state.dart';
import 'package:gopher_escape_app/features/analytics/presentation/widgets/analytics_screen_content.dart';

class AnalyticsScreenBody extends StatelessWidget {
  const AnalyticsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        if (state is AnalyticsInitial) {
          return const Center(child: Text('No data available.'));
        }
        if (state is AnalyticsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AnalyticsLoaded) {
          return AnalyticsScreenContent(state: state);
        } else if (state is AnalyticsError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
