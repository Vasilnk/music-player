// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_recent_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentDBModelAdapter extends TypeAdapter<RecentDBModel> {
  @override
  final int typeId = 2;

  @override
  RecentDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentDBModel(
      id: fields[0] as String,
      title: fields[1] as String,
      artist: fields[2] as String,
      filePath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecentDBModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.filePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
