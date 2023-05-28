import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/repositories/cats_fact_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatsFactsHistoryLength implements UseCase<int, NoParams> {
  const GetCatsFactsHistoryLength(this.repository);

  final ICatsFactRepository repository;

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return repository.getCatFactsHistoryLength();
  }
}
