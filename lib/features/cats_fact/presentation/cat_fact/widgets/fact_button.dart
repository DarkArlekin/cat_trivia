import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/presenter/cat_fact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactButton extends StatelessWidget {
  const CatFactButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      onPressed: () {
        context.read<CatFactBloc>().add(const GetCatFactEvent());
      },
      child: const Text(
        'Another fact!',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
