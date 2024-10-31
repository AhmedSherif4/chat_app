// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:chat/core/failure/failure.dart';
// import 'package:chat/core/usecase/base_usecase.dart';
// import '../../../../../core/shared_models/auth_entity/auth_entity.dart';
// import '../../data/model/app_version_model.dart';
// import '../global_base_repository/global_base_repository.dart';
//
//
//
// @LazySingleton()
// class SendTimeUseCase extends BaseUseCase<bool, int> {
//   final GlobalBaseRepository repository;
//
//   SendTimeUseCase({required this.repository});
//
//   @override
//   Future<Either<Failure, bool>> call(int parameter) async {
//     return await repository.sendTime(parameter);
//   }
// }
//
// // @LazySingleton()
// // class GetGuestDataUseCase extends BaseUseCase<AuthEntity, NoParameter> {
// //
// //   final GlobalBaseRepository repository;
// //
// //   GetGuestDataUseCase(this.repository);
// //
// //   @override
// //   Future<Either<Failure, AuthEntity>> call(NoParameter parameter) async {
// //     return await repository.getGuestData();
// //   }
// // }
//
// @LazySingleton()
// class CheckAppVersionUseCase extends BaseUseCase<AppVersionModel, NoParameter> {
//   final GlobalBaseRepository repository;
//
//   CheckAppVersionUseCase({required this.repository});
//
//   @override
//   Future<Either<Failure, AppVersionModel>> call(NoParameter parameter) async {
//     return await repository.checkAppVersion();
//   }
// }
//
// @LazySingleton()
// class GetInfoUseCase extends BaseUseCase<InfoModel, NoParameter> {
//   final GlobalBaseRepository repository;
//
//   GetInfoUseCase({required this.repository});
//
//   @override
//   Future<Either<Failure, InfoModel>> call(NoParameter parameter) async {
//     return await repository.info();
//   }
// }
