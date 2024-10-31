import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends Equatable {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String? imgPath;
  @HiveField(7)
  final String username;
  @HiveField(8)
  final String? lock;
  @HiveField(9)
  final String? lockMessage;
  @HiveField(10)
  final int? stageId;
  @HiveField(11)
  final int? classroomId;
  @HiveField(12)
  final int? termId;
  @HiveField(13)
  final String? stageName;
  @HiveField(14)
  final String? classroomName;
  @HiveField(15)
  final String? termName;
  @HiveField(16)
  final String? socialId;
  @HiveField(17)
  final int? childrenCount;
  @HiveField(18)
  final String? notificationMarkExam;
  @HiveField(19)
  final String? notificationReUploadExam;
  @HiveField(20)
  final String? notificationLessonFinish;
  @HiveField(21)
  final String? notificationLogin;
  @HiveField(22)
  final String? notificationSessionTime;
  @HiveField(23)
  final int? childInstitutionId;
  @HiveField(24)
  final int? systemId;
  @HiveField(25)
  final int? pathId;
  @HiveField(26)
  final String? systemName;
  @HiveField(27)
  final int? points;


  const UserEntity({
    this.notificationMarkExam,
    this.notificationReUploadExam,
    this.notificationLessonFinish,
    this.notificationLogin,
    this.notificationSessionTime,
    this.childInstitutionId,
    required this.stageName,
    required this.classroomName,
    required this.termName,
    required this.lock,
    required this.lockMessage,
    required this.stageId,
    required this.classroomId,
    required this.termId,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.gender,
    required this.imgPath,
    required this.username,
    required this.userId,
    required this.socialId,
    this.childrenCount,
    this.systemId,
    this.pathId,
    this.systemName,
     this.points,
  });

  UserEntity copyWith({
    int? userId,
    String? name,
    String? email,
    String? phone,
    String? type,
    String? gender,
    String? imgPath,
    String? username,
    String? lock,
    String? lockMessage,
    int? stageId,
    int? classroomId,
    int? termId,
    String? stageName,
    String? classroomName,
    String? termName,
    String? socialId,
    String? notificationMarkExam,
    String? notificationReUploadExam,
    String? notificationLessonFinish,
    String? notificationLogin,
    String? notificationSessionTime,
    int? childInstitutionId,
    int? childrenCount,
    int? systemId,
    int? pathId,
    String? systemName,
     int? points,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      imgPath: imgPath ?? this.imgPath,
      username: username ?? this.username,
      lock: lock ?? this.lock,
      lockMessage: lockMessage ?? this.lockMessage,
      stageId: stageId ?? this.stageId,
      classroomId: classroomId ?? this.classroomId,
      termId: termId ?? this.termId,
      stageName: stageName ?? this.stageName,
      classroomName: classroomName ?? this.classroomName,
      termName: termName ?? this.termName,
      socialId: socialId ?? this.socialId,
      childrenCount: childrenCount ?? this.childrenCount,
      notificationMarkExam: notificationMarkExam ?? this.notificationMarkExam,
      notificationReUploadExam:
      notificationReUploadExam ?? this.notificationReUploadExam,
      notificationLessonFinish:
      notificationLessonFinish ?? this.notificationLessonFinish,
      notificationLogin: notificationLogin ?? this.notificationLogin,
      notificationSessionTime:
      notificationSessionTime ?? this.notificationSessionTime,
      childInstitutionId: childInstitutionId ?? this.childInstitutionId,
      systemId: systemId ?? this.systemId,
      pathId: pathId ?? this.pathId,
      systemName: systemName ?? this.systemName,
      points: points ?? this.points,

    );
  }


  @override
  List<Object?> get props => [
        userId,
        name,
        email,
        phone,
        type,
        gender,
        imgPath,
        username,
        lock,
        lockMessage,
        stageId,
        classroomId,
        termId,
        stageName,
        classroomName,
        termName,
        socialId,
        childrenCount,
        notificationMarkExam,
        notificationReUploadExam,
        notificationLessonFinish,
        notificationLogin,
        notificationSessionTime,
        childInstitutionId,
        systemId,
        systemName,
        pathId,
        points,
      ];
}
