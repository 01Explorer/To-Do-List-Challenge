// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskEntityDaoAdapter extends TypeAdapter<TaskEntityDao> {
  @override
  final int typeId = 0;

  @override
  TaskEntityDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntityDao(
      taskTitle: fields[0] as String,
      content: fields[1] as String,
      endDate: fields[2] as DateTime,
      status: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntityDao obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.taskTitle)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntityDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
