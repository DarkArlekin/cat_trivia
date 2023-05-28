import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/detailed_cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_cats_fact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_fact_event.dart';
part 'cat_fact_state.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  CatFactBloc({
    required this.getCatsFact,
  }) : super(const CatFactState(status: CatFactStateStatus.initial)) {
    on<GetCatFactEvent>(_onGetCatFact);
  }

  final GetCatsFact getCatsFact;

  Future<void> _onGetCatFact(
    GetCatFactEvent event,
    Emitter<CatFactState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CatFactStateStatus.initial,
      ),
    );

    final catFactResp = await getCatsFact(NoParams());

    catFactResp.fold(
      (err) {
        emit(
          state.copyWith(
            status: CatFactStateStatus.failure,
          ),
        );
      },
      (catFact) {
        emit(
          state.copyWith(
            status: CatFactStateStatus.success,
            catFact: catFact,
          ),
        );
      },
    );
  }
}
