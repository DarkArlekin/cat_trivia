import 'package:cat_trivia/features/cats_fact/presentation/cat_fact_history/presenter/cat_facts_history_bloc.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact_history/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsCount = context.select((CatFactsHistoryBloc b) {
      return b.state.status == CatFactsHistoryStateStatus.success
          ? b.state.itemsCount
          : null;
    });

    return IconButton(
      onPressed: itemsCount != null ? () => _onPressed(context) : null,
      icon: const Icon(
        Icons.history_toggle_off_outlined,
      ),
    );
  }

  void _onPressed(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext _,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return BlocProvider.value(
          value: context.read<CatFactsHistoryBloc>(),
          child: const CatFactsHistoruScreen(),
        );
      },
    );
  }
}
