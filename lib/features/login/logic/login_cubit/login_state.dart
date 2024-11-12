part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestStates validateOtpAndLoginStatus;
  final RequestStates verifyPhoneNumberStatus;
  final RequestStates saveUserDataStatus;

  final String? error;
  final UserEntity? user;

  final String text;

  const LoginState({
    this.validateOtpAndLoginStatus = RequestStates.initial,
    this.verifyPhoneNumberStatus = RequestStates.initial,
    this.saveUserDataStatus = RequestStates.initial,
    this.error,
    this.user,
    this.text = '',
  });

  LoginState copyWith({
    RequestStates? validateOtpAndLoginStatus,
    RequestStates? verifyPhoneNumberStatus,
    RequestStates? saveUserDataStatus,
    String? error,
    UserEntity? user,
    String? text,
  }) {
    return LoginState(
      validateOtpAndLoginStatus:
          validateOtpAndLoginStatus ?? this.validateOtpAndLoginStatus,
      verifyPhoneNumberStatus:
          verifyPhoneNumberStatus ?? this.verifyPhoneNumberStatus,
      saveUserDataStatus: saveUserDataStatus ?? this.saveUserDataStatus,
      error: error ?? this.error,
      user: user ?? this.user,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [
        validateOtpAndLoginStatus,
        verifyPhoneNumberStatus,
        saveUserDataStatus,
        error,
        user,
        text,
      ];
}
