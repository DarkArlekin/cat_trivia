import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/detailed_cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/repositories/cats_fact_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatsFact implements UseCase<CatFact, NoParams> {
  const GetCatsFact(this.repository);

  final ICatsFactRepository repository;

  @override
  Future<Either<Failure, DetailedCatFact>> call(NoParams params) async {
    return repository.getDetailedCatFact();
  }
}
