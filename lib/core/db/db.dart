import 'package:cat_trivia/core/db/model/cat_fact.dart';
import 'package:hive_flutter/adapters.dart';

class DB {
  const DB();

  static final List<LazyBox<dynamic>> _boxes = [];

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CatFactHiveModelAdapter());

    _boxes.addAll(
      await Future.wait([
        Hive.openLazyBox<CatFactHiveModel>('catFact'),
      ]),
    );
  }

  static Future<LazyBox<BT>> getBox<BT>() async {
    return _boxes.firstWhere((box) => box is LazyBox<BT>)
        as LazyBox<BT>;
  }
}
