import 'dart:async';

import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/data/datasources/fact_local_data_source.dart';
import 'package:cat_trivia/features/cats_fact/data/datasources/fact_remote_data_source.dart';
import 'package:cat_trivia/features/cats_fact/data/datasources/image_remote_data_source.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cat_image.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cahnge_cat_data_event.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/detailed_cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/repositories/cats_fact_repository.dart';
import 'package:dartz/dartz.dart';

class CatsFactRepository extends ICatsFactRepository {
  const CatsFactRepository({
    required this.factLocalDataSource,
    required this.factRemoteDataSource,
    required this.imageRemoteDataSource,
  });

  final ICatFactLocalDataSource factLocalDataSource;
  final ICatFactRemoteDataSource factRemoteDataSource;
  final ICatImageRemoteDataSource imageRemoteDataSource;

  @override
  Stream<CahngeCatDataEvent> getChangesStream() {
    return factLocalDataSource
        .getChangesStream()
        .map(CahngeCatDataEvent.fromModel);
  }

  @override
  Future<Either<Failure, int>> getCatFactsHistoryLength() async {
    try {
      final historyLength =
          await factLocalDataSource.getCatsFactsHistoryLength();
      return Right(historyLength);
    } catch (err) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatFact>>> getCatFactsHistory(
    int from,
    int count,
  ) async {
    try {
      final historyPage =
          await factLocalDataSource.getCatFactsHistory(from, count);
      return Right(historyPage.map(CatFact.fromModel).toList());
    } catch (err) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, DetailedCatFact>> getDetailedCatFact() async {
    try {
      late final CatFactModel catFact;
      late final CatImageModel catImage;

      await Future.wait([
        factRemoteDataSource.getCatFact().then((value) => catFact = value),
        imageRemoteDataSource.getCatImage().then((value) => catImage = value),
      ]);

      unawaited(factLocalDataSource.saveCatFact(catFact));

      return Right(DetailedCatFact.fromModels(catFact, catImage));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
