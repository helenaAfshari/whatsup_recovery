// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_whatsup_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotifWithTimeModelAdapter extends TypeAdapter<NotifWithTimeModel> {
  @override
  final int typeId = 0;

  @override
  NotifWithTimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotifWithTimeModel(
      fields[0] as DateTime,
      fields[1] as NotificationEventHive,
    );
  }

  @override
  void write(BinaryWriter writer, NotifWithTimeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.servicenotif);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotifWithTimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoomModelAdapter extends TypeAdapter<RoomModel> {
  @override
  final int typeId = 1;

  @override
  RoomModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomModel(
      name: fields[0] as String,
      date: fields[1] as DateTime,
      lastMsg: fields[2] as NotifWithTimeModel,
      messages: (fields[3] as List).cast<NotifWithTimeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RoomModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.lastMsg)
      ..writeByte(3)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
