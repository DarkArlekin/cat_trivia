import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cat_fact.g.dart';

@HiveType(typeId: 1)
class CatFactHiveModel extends Equatable {
  const CatFactHiveModel(
    this.id,
    this.createdAt,
    this.text,
  );

  factory CatFactHiveModel.fromModel(CatFactModel model) => CatFactHiveModel(
    model.id,
    model.createdAt,
    model.text,
  );

  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final String text;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        text,
      ];
}
