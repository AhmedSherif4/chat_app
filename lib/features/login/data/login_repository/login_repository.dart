part of '../../login.dart';

abstract class LoginBaseRepository {
  Future<Either<Failure, void>> getCodeWithPhoneNumber(String phoneNumber);

  Future<Either<Failure, UserEntity>> validateOtpAndLogin(String smsCode);

  Future<Either<Failure, UserEntity>> saveUserData(UserModel userModel);
}

@LazySingleton(as: LoginBaseRepository)
class LoginRepository implements LoginBaseRepository {
  final LoginRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;
  final UserLocalDataSource userLocalDataSource;

  LoginRepository({
    required this.remoteDataSource,
    required this.baseRepository,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, void>> getCodeWithPhoneNumber(
      String phoneNumber) async {
    return await baseRepository.checkExceptionForRemoteData(
        remoteDataSource.getCodeWithPhoneNumber(phoneNumber));
  }

  @override
  Future<Either<Failure, UserEntity>> saveUserData(UserModel userModel) async {
    final result = await baseRepository
        .checkExceptionForRemoteData(remoteDataSource.saveUserData(userModel));
    return result.fold(
      (l) => left(l),
      (r) async {
        await userLocalDataSource.saveUserData(userModel: r);

        return right(r);
      },
    );
  }

  @override
  Future<Either<Failure, UserEntity>> validateOtpAndLogin(
      String smsCode) async {
    final result = await baseRepository.checkExceptionForRemoteData(
        remoteDataSource.validateOtpAndLogin(smsCode));
    return result.fold(
      (l) => left(l),
      (r) async {
        if (r.name != null && r.imgPath != null) {
          await getIt<AppPreferences>().saveUserDataAddedStatus(true);
        }
        await userLocalDataSource.saveUserData(userModel: r);
        return right(r);
      },
    );
  }
}
