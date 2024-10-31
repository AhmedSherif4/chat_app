import 'package:chat/core/enum/enum_generation.dart';

import '../user_entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.type,
    required super.gender,
    required super.imgPath,
    required super.username,
    required super.userId,
    super.lock,
    super.lockMessage,
    super.stageId,
    super.classroomId,
    super.termId,
    super.stageName,
    super.classroomName,
    super.termName,
    super.childrenCount,
    super.childInstitutionId,
    super.notificationLessonFinish,
    super.notificationLogin,
    super.notificationMarkExam,
    super.notificationReUploadExam,
    super.notificationSessionTime,
    required super.socialId,
    super.systemId,
    super.pathId,
    super.systemName,
    super.points,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return json['type'] == UsersType.child.name
        ? UserModel(
            name: json['name'] as String,
            email: json['email'] != null ? json['email'] as String : null,
            phone: json['phone'] != null ? json['phone'] as String : null,
            type: json['type'] as String,
            gender: json['gendar'] ?? '',
            imgPath: json['img'] != null ? json['img'] as String : '',
            username: json['username'].toString(),
            userId: json['id'] as int,
            lock: json['lock'] ?? '',
            lockMessage: json['lock_message'] ?? '',
            stageId: json['stage_id'] ?? 0,
            classroomId: json['classroom_id'] ?? 0,
            termId: json['term_id'] ?? 0,
            systemName:
                json['system'] != null ? json['system']['name'] ?? '' : '',
            stageName: json['stage'] != null ? json['stage']['name'] ?? '' : '',
            classroomName: json['classroom'] != null
                ? json['classroom']['name'] ?? ''
                : '',
            termName: json['term'] != null ? json['term']['name'] ?? '' : '',
            socialId:
                json['social_id'] != null ? json['social_id'].toString() : '',
            childInstitutionId: json['institution_id'],
            systemId: json['system_id'] ?? 0,
            pathId: json['path_id'] ?? 0,
            points: json['points'] ?? 0,
          )
        : UserModel(
            name: json['name'] as String,
            email: json['email'] != null ? json['email'] as String : null,
            phone: json['phone'] != null ? json['phone'] as String : null,
            type: json['type'] as String,
            gender: json['gendar'] ?? '',
            imgPath: json['img'] != null ? json['img'] as String : '',
            username: json['username'].toString(),
            userId: json['id'] as int,
            socialId:
                json['social_id'] != null ? json['social_id'].toString() : '',
            childrenCount: json['children_count'] ?? 0,
            notificationMarkExam: json['noti_mark_exam'] ?? 'on',
            notificationReUploadExam: json['noti_reupload_exam'] ?? 'on',
            notificationLessonFinish: json['noti_lesson_finish'] ?? 'on',
            notificationLogin: json['noti_login'] ?? 'on',
            notificationSessionTime: json['noti_session_time'] ?? 'on',
          );
  }
}
