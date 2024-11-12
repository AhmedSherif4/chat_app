import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? imgPath;
  @HiveField(3)
  final String? phone;

  const UserEntity({
    required this.name,
    required this.phone,
    required this.imgPath,
    required this.userId,
  });

  UserEntity copyWith({
    String? userId,
    String? name,
    String? phone,
    String? imgPath,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      imgPath: imgPath ?? this.imgPath,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        name,
        phone,
        imgPath,
      ];
}
