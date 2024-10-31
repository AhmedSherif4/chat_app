import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final UserEntity user;
  final String token;
  final String message;

  const AuthEntity({
    required this.user,
    required this.token,
    required this.message,
  });

  @override
  List<Object> get props => [
        user,
        token,
        message,
      ];
}
