// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif_event_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationEventHiveAdapter extends TypeAdapter<NotificationEventHive> {
  @override
  final int typeId = 2;

  @override
  NotificationEventHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationEventHive(
      id: fields[0] as int?,
      canReply: fields[1] as bool?,
      haveExtraPicture: fields[2] as bool?,
      hasRemoved: fields[3] as bool?,
      extrasPicture: fields[4] as Uint8List?,
      packageName: fields[5] as String?,
      title: fields[6] as String?,
      appIcon: fields[7] as Uint8List?,
      largeIcon: fields[8] as Uint8List?,
      content: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationEventHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.canReply)
      ..writeByte(2)
      ..write(obj.haveExtraPicture)
      ..writeByte(3)
      ..write(obj.hasRemoved)
      ..writeByte(4)
      ..write(obj.extrasPicture)
      ..writeByte(5)
      ..write(obj.packageName)
      ..writeByte(6)
      ..write(obj.title)
      ..writeByte(7)
      ..write(obj.appIcon)
      ..writeByte(8)
      ..write(obj.largeIcon)
      ..writeByte(9)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationEventHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
