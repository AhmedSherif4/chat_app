// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:chat/core/failure/failure.dart';
// import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
// import 'package:chat/core/usecase/base_usecase.dart';
// import '../splash_base_repository/splash_base_repository.dart';
//
// @LazySingleton()
// class CheckUserTokenUseCase extends BaseUseCase<bool, NoParameter> {
//   final CheckUserTokenBaseRepository repository;
//
//   CheckUserTokenUseCase({required this.repository});
//
//   @override
//   Future<Either<Failure, bool>> call(NoParameter parameter) async {
//     return await repository.checkUserToken();
//   }
// }
//
//
// @LazySingleton()
// class EditUserDataUseCase extends BaseUseCase<UserEntity, NoParameter> {
//   final CheckUserTokenBaseRepository repository;
//
//   EditUserDataUseCase({required this.repository});
//
//   @override
//   Future<Either<Failure, UserEntity>> call(NoParameter parameter) async {
//     return await repository.editUserData();
//   }
// }
