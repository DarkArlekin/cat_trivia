part of 'cat_facts_history_bloc.dart';

enum CatFactsHistoryStateStatus {
  initial,
  loading,
  success,
  failure,
}

class CatFactsHistoryState extends Equatable {
  const CatFactsHistoryState({
    required this.status,
    this.items = const [],
    this.itemsCount,
  });

  final CatFactsHistoryStateStatus status;
  final List<CatFact> items;
  final int? itemsCount;

  @override
  List<Object?> get props => [
        status,
        items,
        itemsCount,
      ];

  CatFactsHistoryState copyWith({
    CatFactsHistoryStateStatus? status,
    List<CatFact>? items,
    int? itemsCount,
  }) {
    return CatFactsHistoryState(
      status: status ?? this.status,
      items: items ?? this.items,
      itemsCount: itemsCount ?? this.itemsCount,
    );
  }
}
