import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cahnge_cat_data_event.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/detailed_cat_fact.dart';
import 'package:dartz/dartz.dart';

abstract class ICatsFactRepository {
  const ICatsFactRepository();

  Stream<CahngeCatDataEvent> getChangesStream();

  Future<Either<Failure, int>> getCatFactsHistoryLength();

  Future<Either<Failure, List<CatFact>>> getCatFactsHistory(
    int from,
    int count,
  );

  Future<Either<Failure, DetailedCatFact>> getDetailedCatFact();
}
