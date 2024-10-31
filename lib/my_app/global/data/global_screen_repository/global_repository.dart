// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:chat/config/base_repository/base_repository.dart';
// import 'package:chat/core/failure/failure.dart';
// import 'package:chat/core/shared_models/auth_entity/auth_entity.dart';
// import '../../../../../config/storages/secure_storage.dart';
// import '../../../../../core/services/services_locator.dart';
// import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
// import '../../domain/global_base_repository/global_base_repository.dart';
// import '../global_data_source/global_remote_data_source.dart';
// import '../model/app_version_model.dart';
//
// @LazySingleton(as: GlobalBaseRepository)
// class GlobalRepository implements GlobalBaseRepository {
//   final GlobalBaseRemoteDataSource remoteDataSource;
//   final BaseRepository baseRepository;
//   final UserLocalDataSource userLocalDataSource;
//
//   GlobalRepository({
//     required this.remoteDataSource,
//     required this.baseRepository,
//     required this.userLocalDataSource,
//   });
//
//
//   @override
//   Future<Either<Failure, bool>> sendTime(int min) async {
//     final json = await baseRepository.checkExceptionForRemoteData(
//       remoteDataSource.sendTime(min),
//     );
//     return json.fold(
//       (failure) => left(failure),
//       (data) => right(data),
//     );
//   }
//
//   // @override
//   // Future<Either<Failure, AuthEntity>> getGuestData() async {
//   //   final json = await baseRepository.checkExceptionForRemoteData(
//   //     remoteDataSource.getGuestData(),
//   //   );
//   //   return json.fold(
//   //         (failure) => left(failure),
//   //         (data) async {
//   //           await getIt<BaseAppSecurityData>().deleteToken();
//   //           await userLocalDataSource.saveUserData(userModel: data.user);
//   //           await getIt<BaseAppSecurityData>().saveToken(token: data.token);
//   //           return right(data);
//   //         },
//   //   );
//   // }
//
//   @override
//   Future<Either<Failure, AppVersionModel>> checkAppVersion() async {
//     final json = await baseRepository.checkExceptionForRemoteData(
//       remoteDataSource.checkAppVersion(),
//     );
//     return json.fold(
//           (failure) => left(failure),
//           (data) => right(data),
//     );
//   }
//
//   @override
//   Future<Either<Failure, InfoModel>> info() async {
//
//     final jsonData = await baseRepository.checkExceptionForRemoteData(
//       remoteDataSource.info(),
//     );
//     return jsonData.fold(
//           (failure) => left(failure),
//           (data) async {
//             return Right(data);
//       },
//     );
//   }
// }
