import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_image.g.dart';

@JsonSerializable()
class CatImageModel extends Equatable {
  const CatImageModel(
    this.id,
    this.url,
  );

  factory CatImageModel.fromJson(Map<String, dynamic> json) =>
      _$CatImageModelFromJson(json);

  final String id;
  final String url;

  @override
  List<Object?> get props => [
        id,
        url,
      ];

  Map<String, dynamic> toJson() => _$CatImageModelToJson(this);
}
