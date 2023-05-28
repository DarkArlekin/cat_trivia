import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cahnge_cat_data_event.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_cats_facts_history.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_cats_facts_history_length.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_changes_stream.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_facts_history_event.dart';
part 'cat_facts_history_state.dart';

const itemsPerPage = 20;

class CatFactsHistoryBloc
    extends Bloc<CatFactsHistoryEvent, CatFactsHistoryState> {
  CatFactsHistoryBloc(
    this.getChangesStream,
    this.getCatsFactsHistory,
    this.getCatsFactsHistoryLength,
  ) : super(
          const CatFactsHistoryState(
            status: CatFactsHistoryStateStatus.initial,
          ),
        ) {
    on<CatFactsHistoryInitEvent>(_onCatFactsHistoryInit);
    on<CatFactsHistoryChangeEvent>(_onCatFactsHistoryChange);
    on<CatFactsHistoryGetEvent>(_onCatFactsHistoryGet);
  }

  final GetChangesStream getChangesStream;
  final GetCatsFactsHistory getCatsFactsHistory;
  final GetCatsFactsHistoryLength getCatsFactsHistoryLength;

  late final Stream<CahngeCatDataEvent> changesStream;

  Future<void> _onCatFactsHistoryInit(
    CatFactsHistoryInitEvent event,
    Emitter<CatFactsHistoryState> emit,
  ) async {
    final historyLength = await getCatsFactsHistoryLength(NoParams());
    historyLength.fold(
      (err) => emit(
        state.copyWith(
          status: CatFactsHistoryStateStatus.failure,
        ),
      ),
      (res) => emit(
        state.copyWith(
          itemsCount: res,
          status: CatFactsHistoryStateStatus.success,
        ),
      ),
    );
    changesStream = getChangesStream(NoParams());
    changesStream.listen((e) {
      if (e.eventType == CahngeCatDataEventType.add) {
        add(
          CatFactsHistoryChangeEvent(
            CatFactsHistoryChangeTypeEvent.added,
            e.catFact,
          ),
        );
      }
    });
  }

  Future<void> _onCatFactsHistoryGet(
    CatFactsHistoryGetEvent event,
    Emitter<CatFactsHistoryState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CatFactsHistoryStateStatus.loading,
      ),
    );

    final history = await getCatsFactsHistory(
      GetCatsFactsHistoryParams(state.items.length, itemsPerPage),
    );

    history.fold(
      (err) => emit(
        state.copyWith(
          status: CatFactsHistoryStateStatus.failure,
        ),
      ),
      (res) {
        emit(
          state.copyWith(
            items: [...state.items, ...res],
            status: CatFactsHistoryStateStatus.success,
          ),
        );
      },
    );
  }

  void _onCatFactsHistoryChange(
    CatFactsHistoryChangeEvent event,
    Emitter<CatFactsHistoryState> emit,
  ) {
    if (event.type == CatFactsHistoryChangeTypeEvent.added) {
      emit(
        state.copyWith(
          items: [event.item!, ...state.items],
          itemsCount: state.itemsCount! + 1,
        ),
      );
    }
  }
}
