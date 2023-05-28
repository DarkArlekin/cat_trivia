// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFactModel _$CatFactModelFromJson(Map<String, dynamic> json) => CatFactModel(
      json['_id'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['text'] as String,
    );

Map<String, dynamic> _$CatFactModelToJson(CatFactModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'text': instance.text,
    };
