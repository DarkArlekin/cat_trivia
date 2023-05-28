part of 'cat_facts_history_bloc.dart';

abstract class CatFactsHistoryEvent extends Equatable {
  const CatFactsHistoryEvent();

  @override
  List<Object?> get props => [];
}

class CatFactsHistoryInitEvent extends CatFactsHistoryEvent {
  const CatFactsHistoryInitEvent();
}

class CatFactsHistoryGetEvent extends CatFactsHistoryEvent {
  const CatFactsHistoryGetEvent();
}

enum CatFactsHistoryChangeTypeEvent {
  added,
  deleted,
}

class CatFactsHistoryChangeEvent extends CatFactsHistoryEvent {
  const CatFactsHistoryChangeEvent(this.type, [this.item]);

  final CatFactsHistoryChangeTypeEvent type;
  final CatFact? item;

  @override
  List<Object?> get props => [
        type,
        item,
      ];
}
