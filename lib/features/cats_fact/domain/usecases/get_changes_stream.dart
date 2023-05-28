import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cahnge_cat_data_event.dart';
import 'package:cat_trivia/features/cats_fact/domain/repositories/cats_fact_repository.dart';

class GetChangesStream implements StreamUseCase<CahngeCatDataEvent, NoParams> {
  const GetChangesStream(this.repository);

  final ICatsFactRepository repository;

  @override
  Stream<CahngeCatDataEvent> call(NoParams params) {
    return repository.getChangesStream();
  }
}
