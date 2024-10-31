part of '../../splash_screen.dart';

class SplashState extends Equatable {
  final bool isValidToken;
  final RequestStates checkTokenEventIsFinish;
  // final PhysicalDeviceState checkIsRealDevice;
  final String checkTokenErrorMessage;

  final RequestStates editUseDataEventIsFinish;
  final String editUseDataErrorMessage;

  const SplashState({
    this.isValidToken = false,
    this.checkTokenEventIsFinish = RequestStates.initial,
    // this.checkIsRealDevice = PhysicalDeviceState.initial,
    this.checkTokenErrorMessage = '',
    this.editUseDataEventIsFinish = RequestStates.initial,
    this.editUseDataErrorMessage = '',
  });

  SplashState copyWith({
    bool? isValidToken,
    RequestStates? checkTokenEventIsFinish,
    String? checkTokenErrorMessage,
    PhysicalDeviceState? checkIsRealDevice,
    RequestStates? editUseDataEventIsFinish,
    final String? editUseDataErrorMessage,
  }) {
    return SplashState(
      isValidToken: isValidToken ?? this.isValidToken,
      checkTokenEventIsFinish:
          checkTokenEventIsFinish ?? this.checkTokenEventIsFinish,
      checkTokenErrorMessage:
          checkTokenErrorMessage ?? this.checkTokenErrorMessage,
      // checkIsRealDevice: checkIsRealDevice ?? this.checkIsRealDevice,
      editUseDataErrorMessage:
          editUseDataErrorMessage ?? this.editUseDataErrorMessage,
      editUseDataEventIsFinish:
          editUseDataEventIsFinish ?? this.editUseDataEventIsFinish,
    );
  }

  @override
  List<Object?> get props => [
        isValidToken,
        checkTokenEventIsFinish,
        checkTokenErrorMessage,
        // checkIsRealDevice,
        editUseDataEventIsFinish,
        editUseDataErrorMessage,
      ];
}
