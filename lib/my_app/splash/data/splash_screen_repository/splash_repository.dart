// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
// import '../../../../../config/base_repository/base_repository.dart';
// import '../../../../../core/failure/failure.dart';
// import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
// import '../../domain/splash_base_repository/splash_base_repository.dart';
// import '../splash_data_source/splash_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_repository/base_repository.dart';
import '../../../../core/failure/failure.dart';
import '../splash_data_source/splash_remote_data_source.dart';

abstract class SplashBaseRepository {
  // Future<Either<Failure, bool>> checkUserToken();
  // Future<Either<Failure, UserEntity>> editUserData();
  Future<Either<Failure, bool>> isAlreadyAuthenticated();
}

@LazySingleton(as: SplashBaseRepository)
class SplashRepository implements SplashBaseRepository {
  final SplashBaseRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;

  SplashRepository(
      {required this.remoteDataSource, required this.baseRepository});

  @override
  Future<Either<Failure, bool>> isAlreadyAuthenticated() {
    return baseRepository
        .checkExceptionForRemoteData(remoteDataSource.isAlreadyAuthenticated());
  }
}
