import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/widgets/fact_button.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/widgets/fact_image.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/widgets/fact_text.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/widgets/history_button.dart';
import 'package:cat_trivia/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatsFactScreen extends StatelessWidget {
  const CatsFactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Cat Trivia',
      actions: [HistoryButton()],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CatFactImage(),
                SizedBox(height: 12),
                CatFactDescription(),
                SizedBox(height: 16),
                CatFactButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
