part of 'cat_fact_bloc.dart';

enum CatFactStateStatus {
  initial,
  success,
  failure,
}

class CatFactState extends Equatable {
  const CatFactState({
    required this.status,
    this.catFact,
  });

  final CatFactStateStatus status;
  final DetailedCatFact? catFact;

  @override
  List<Object?> get props => [
        status,
        catFact,
      ];

  CatFactState copyWith({
    CatFactStateStatus? status,
    DetailedCatFact? catFact,
  }) {
    return CatFactState(
      status: status ?? this.status,
      catFact: catFact ?? this.catFact,
    );
  }
}
