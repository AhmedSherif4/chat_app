part of '../../login.dart';

abstract class LoginRemoteDataSource {
  Future<void> getCodeWithPhoneNumber(String phoneNumber);

  Future<UserEntity> validateOtpAndLogin(String smsCode);

  Future<UserEntity> saveUserData(UserModel userModel);

}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  LoginRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  String? actualCode;
  User? firebaseUser;
  UserCredential? userCredential;

  @override
  Future<void> getCodeWithPhoneNumber(String phoneNumber) async {
    await NoInternetConnectionException().checkNetworkConnection();
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential auth) async {},
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      throw ServerException(
        message: error.toString(),
      );
    }
  }

  @override
  Future<UserEntity> validateOtpAndLogin(String smsCode) async {
    if (actualCode == null) {
      throw ServerException(
        message: 'Something went wrong, please try again later...',
      );
    }
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: actualCode!,
        smsCode: smsCode,
      );

      userCredential = await firebaseAuth.signInWithCredential(authCredential);
      firebaseUser = userCredential?.user;

      if (firebaseUser == null) {
        throw ServerException(
          message: 'Invalid code/invalid authentication',
        );
      }
      return UserModel(
        name: userCredential?.user?.displayName,
        phone: userCredential?.user?.phoneNumber,
        imgPath: userCredential?.user?.photoURL,
        userId: userCredential?.user?.uid,
      );
    } catch (error) {
      throw ServerException(
        message: error.toString(),
      );
    }
  }

  @override
  Future<UserEntity> saveUserData(UserModel userModel) async {
    await NoInternetConnectionException().checkNetworkConnection();

    // User is signing up for the first time
    try {
      String uid = getIt<UserLocalDataSource>()
          .getUserData()
          ?.userId ?? '';
      await firestore.collection('users').doc(uid).set({
        'name': userModel.name,
        'imgPath': userModel.imgPath,
        'phoneNumber': userCredential?.user?.phoneNumber,
      });
      return UserModel(
        name: userModel.name,
        phone: userCredential?.user?.phoneNumber,
        imgPath: userModel.imgPath,
        userId: uid,
      );
    } catch (error) {
      throw ServerException(
        message: error.toString(),
      );
    }
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    actualCode = verificationId;
  }

  void codeSent(String verificationId,
      int? forceResendingToken,) async {
    actualCode = verificationId;
  }

  void verificationFailed(FirebaseAuthException authException) {
    throw ServerException(
      message: authException.message ??
          'The phone number format is incorrect. Please enter your number in E.164 format. [+][country code][number]',
    );
  }

}
