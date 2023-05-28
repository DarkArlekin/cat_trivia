import 'package:cat_trivia/features/cats_fact/presentation/cat_fact_history/widgets/history.dart';
import 'package:cat_trivia/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatFactsHistoruScreen extends StatelessWidget {
  const CatFactsHistoruScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'History',
      body: HistoryList(),
    );
  }
}
