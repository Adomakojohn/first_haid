// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_messages.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedMessagesAdapter extends TypeAdapter<CachedMessages> {
  @override
  final int typeId = 0;

  @override
  CachedMessages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedMessages(
      userId: fields[0] as String,
      text: fields[1] as String,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedMessages obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedMessagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
