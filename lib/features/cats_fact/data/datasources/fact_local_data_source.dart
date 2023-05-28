import 'dart:async';

import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/core/db/model/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cahnge_cat_data_event.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cahnge_cat_data_event.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

abstract class ICatFactLocalDataSource {
  Stream<CahngeCatDataEventModel> getChangesStream();

  Future<int> saveCatFact(CatFactModel catFact);

  Future<int> getCatsFactsHistoryLength();

  Future<List<CatFactModel>> getCatFactsHistory(int from, int count);
}

class CatFactLocalDataSource implements ICatFactLocalDataSource {
  const CatFactLocalDataSource({required this.modelBox});

  final LazyBox<CatFactHiveModel> modelBox;

  @override
  Stream<CahngeCatDataEventModel> getChangesStream() {
    return modelBox.watch().map(
          (e) => CahngeCatDataEventModel(
            e.deleted
                ? CahngeCatDataEventType.remove
                : CahngeCatDataEventType.add,
            CatFactModel.fromHiveModel(e.value as CatFactHiveModel),
          ),
        );
  }

  @override
  Future<int> saveCatFact(CatFactModel catFact) async {
    return modelBox.add(CatFactHiveModel.fromModel(catFact));
  }

  @override
  Future<int> getCatsFactsHistoryLength() async {
    try {
      return modelBox.length;
    } catch (err) {
      Logger().e(err);

      throw CacheException();
    }
  }

  @override
  Future<List<CatFactModel>> getCatFactsHistory(int from, int count) async {
    final catFacts = <CatFactModel>[];

    try {
      final elementsRemain = modelBox.keys.length - from;
      final takeCount = elementsRemain > count ? count : elementsRemain;
      final keys = modelBox.keys
          .toList()
          .reversed
          .skip(from)
          .take(takeCount);

      for (final key in keys) {
        final hiveModel = await modelBox.get(key);
        catFacts.add(CatFactModel.fromHiveModel(hiveModel!));
      }
    } catch (err) {
      Logger().e(err);

      throw CacheException();
    }

    return catFacts;
  }
}
