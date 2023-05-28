import 'package:cat_trivia/features/cats_fact/presentation/cat_fact_history/presenter/cat_facts_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  bool ignoreFetchData = false;

  @override
  void initState() {
    final state = context.read<CatFactsHistoryBloc>().state;
    ignoreFetchData = state.items.length > itemsPerPage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.select(
      (CatFactsHistoryBloc b) => (
        itemsCount: b.state.itemsCount!,
        items: b.state.items,
        status: b.state.status,
      ),
    );

    final items = data.items;
    final hasReachedMax = items.length >= data.itemsCount;
    final itemCount = items.length + (hasReachedMax ? 0 : 1);

    return InfiniteList(
      padding: const EdgeInsets.symmetric(vertical: 8),
      isLoading: data.status == CatFactsHistoryStateStatus.initial,
      itemCount: itemCount,
      hasReachedMax: hasReachedMax,
      onFetchData: () {
        if (ignoreFetchData) {
          ignoreFetchData = false;
          return;
        }

        context.read<CatFactsHistoryBloc>().add(
              const CatFactsHistoryGetEvent(),
            );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final isProgressIndicator = !hasReachedMax && index == itemCount - 1;
        if (isProgressIndicator) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        final item = items[index];
        return ListTile(
          dense: true,
          title: Text(
            item.text,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              item.createdDate,
            ),
          ),
        );
      },
    );
  }
}
