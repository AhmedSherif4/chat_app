import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/failure/failure.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> checkExceptionForRemoteData<T>(
    Future<T> jsonFromRemoteData,
  );
}

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {
  BaseRepositoryImpl();

  @override
  Future<Either<Failure, T>> checkExceptionForRemoteData<T>(
    Future<T> jsonFromRemoteData,
  ) async {
    try {
      return Right(await jsonFromRemoteData);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }
}
