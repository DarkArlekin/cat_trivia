import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cahnge_cat_data_event.dart';

class CahngeCatDataEventModel {
  const CahngeCatDataEventModel(this.eventType, this.catFact);

  final CahngeCatDataEventType eventType;
  final CatFactModel catFact;
  
  // CahngeCatDataEventModel copyWith({
  //   CatFactModel? catFact,
  // }) {
  //   return CahngeCatDataEventModel(
  //     eventType,
  //     catFact ?? this.catFact,
  //   );
  // }
}
