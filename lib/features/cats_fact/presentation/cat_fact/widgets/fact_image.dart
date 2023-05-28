import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/presenter/cat_fact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CatFactImage extends StatelessWidget {
  const CatFactImage({super.key});

  @override
  Widget build(BuildContext context) {
    final catFactImage = context.select((CatFactBloc b) {
      return b.state.status == CatFactStateStatus.success
          ? b.state.catFact!.image
          : '';
    });

    return BlocBuilder<CatFactBloc, CatFactState>(
      builder: (context, state) {
        return Container(
          height: 220,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FittedBox(
                fit: BoxFit.fitHeight,
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  catFactImage,
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : CatFactImageShimmer(constraints: constraints);
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return CatFactImageShimmer(constraints: constraints);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CatFactImageShimmer extends StatelessWidget {
  const CatFactImageShimmer({
    required this.constraints,
    super.key,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white38,
      highlightColor: Colors.blue[100]!,
      child: Container(
        constraints: constraints,
        color: Colors.amber,
      ),
    );
  }
}
