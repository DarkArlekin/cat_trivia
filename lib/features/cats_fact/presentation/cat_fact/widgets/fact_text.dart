import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/presenter/cat_fact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CatFactDescription extends StatelessWidget {
  const CatFactDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final catFact = context.select((CatFactBloc b) {
      return b.state.status == CatFactStateStatus.success
          ? b.state.catFact
          : null;
    });

    return catFact != null
        ? Column(
            children: [
              Text(
                catFact.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 8),
              Text(
                catFact.createdDate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        : Shimmer.fromColors(
            baseColor: Colors.blue[100]!,
            highlightColor: Colors.blue[200]!,
            child: const Text(
              'loading cat fact...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          );
  }
}
