// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactHiveModelAdapter extends TypeAdapter<CatFactHiveModel> {
  @override
  final int typeId = 1;

  @override
  CatFactHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFactHiveModel(
      fields[0] as String,
      fields[1] as DateTime,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatFactHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
