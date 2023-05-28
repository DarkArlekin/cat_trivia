import 'package:cat_trivia/core/db/model/cat_fact.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
class CatFactModel extends Equatable {
  const CatFactModel(
    this.id,
    this.createdAt,
    this.text,
  );

  factory CatFactModel.fromJson(Map<String, dynamic> json) =>
      _$CatFactModelFromJson(json);

  factory CatFactModel.fromHiveModel(CatFactHiveModel model) => CatFactModel(
    model.id,
    model.createdAt,
    model.text,
  );

  @JsonKey(name: '_id')
  final String id;
  final DateTime createdAt;
  final String text;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        text,
      ];

  Map<String, dynamic> toJson() => _$CatFactModelToJson(this);
}
