import '../user_entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.phone,
    required super.imgPath,
    required super.userId,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      name: json['displayName'] != null ? json['displayName'] as String : null,
      phone: json['phoneNumber'] != null ? json['phoneNumber'] as String : null,
      imgPath: json['photoURL'] != null ? json['photoURL'] as String : '',
      userId: json['uid'] != null ? json['uid'] as String : null,
    );
  }
}
