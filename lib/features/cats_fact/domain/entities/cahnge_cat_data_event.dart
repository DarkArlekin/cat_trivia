import 'package:cat_trivia/features/cats_fact/data/models/cahnge_cat_data_event.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';

enum CahngeCatDataEventType { add, remove }

class CahngeCatDataEvent {
  const CahngeCatDataEvent(this.eventType, this.catFact);

  factory CahngeCatDataEvent.fromModel(CahngeCatDataEventModel model) =>
      CahngeCatDataEvent(
        model.eventType,
        CatFact.fromModel(model.catFact),
      );

  final CahngeCatDataEventType eventType;
  final CatFact catFact;
}
