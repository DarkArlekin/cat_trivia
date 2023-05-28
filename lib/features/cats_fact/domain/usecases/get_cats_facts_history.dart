import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/repositories/cats_fact_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCatsFactsHistory
    implements UseCase<List<CatFact>, GetCatsFactsHistoryParams> {
  const GetCatsFactsHistory(this.repository);

  final ICatsFactRepository repository;

  @override
  Future<Either<Failure, List<CatFact>>> call(
    GetCatsFactsHistoryParams params,
  ) async {
    return repository.getCatFactsHistory(params.from, params.count,);
  }
}

class GetCatsFactsHistoryParams extends Equatable {
  const GetCatsFactsHistoryParams(this.from, this.count);

  final int from;
  final int count;

  @override
  List<Object?> get props => [
        from,
        count,
      ];
}
