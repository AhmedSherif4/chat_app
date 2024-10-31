// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      notificationMarkExam: fields[18] as String?,
      notificationReUploadExam: fields[19] as String?,
      notificationLessonFinish: fields[20] as String?,
      notificationLogin: fields[21] as String?,
      notificationSessionTime: fields[22] as String?,
      childInstitutionId: fields[23] as int?,
      stageName: fields[13] as String?,
      classroomName: fields[14] as String?,
      termName: fields[15] as String?,
      lock: fields[8] as String?,
      lockMessage: fields[9] as String?,
      stageId: fields[10] as int?,
      classroomId: fields[11] as int?,
      termId: fields[12] as int?,
      name: fields[1] as String,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      type: fields[4] as String,
      gender: fields[5] as String,
      imgPath: fields[6] as String?,
      username: fields[7] as String,
      userId: fields[0] as int,
      socialId: fields[16] as String?,
      childrenCount: fields[17] as int?,
      systemId: fields[24] as int?,
      pathId: fields[25] as int?,
      systemName: fields[26] as String?,
      points: fields[27] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.imgPath)
      ..writeByte(7)
      ..write(obj.username)
      ..writeByte(8)
      ..write(obj.lock)
      ..writeByte(9)
      ..write(obj.lockMessage)
      ..writeByte(10)
      ..write(obj.stageId)
      ..writeByte(11)
      ..write(obj.classroomId)
      ..writeByte(12)
      ..write(obj.termId)
      ..writeByte(13)
      ..write(obj.stageName)
      ..writeByte(14)
      ..write(obj.classroomName)
      ..writeByte(15)
      ..write(obj.termName)
      ..writeByte(16)
      ..write(obj.socialId)
      ..writeByte(17)
      ..write(obj.childrenCount)
      ..writeByte(18)
      ..write(obj.notificationMarkExam)
      ..writeByte(19)
      ..write(obj.notificationReUploadExam)
      ..writeByte(20)
      ..write(obj.notificationLessonFinish)
      ..writeByte(21)
      ..write(obj.notificationLogin)
      ..writeByte(22)
      ..write(obj.notificationSessionTime)
      ..writeByte(23)
      ..write(obj.childInstitutionId)
      ..writeByte(24)
      ..write(obj.systemId)
      ..writeByte(25)
      ..write(obj.pathId)
      ..writeByte(26)
      ..write(obj.systemName)
      ..writeByte(27)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
