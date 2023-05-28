import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/presenter/cat_fact_bloc.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/view/view.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact_history/presenter/cat_facts_history_bloc.dart';
import 'package:cat_trivia/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<CatFactBloc>()
              ..add(
                const GetCatFactEvent(),
              ),
          ),
          BlocProvider(
            create: (_) => sl<CatFactsHistoryBloc>()
              ..add(
                const CatFactsHistoryInitEvent(),
              ),
          ),
        ],
        child: const CatsFactScreen(),
      ),
    );
  }
}
