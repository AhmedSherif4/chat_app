part of '../../splash_screen.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  // final CheckUserTokenUseCase checkUserTokenUseCase;
  // final EditUserDataUseCase editUserDataUseCase;

  bool isLogoutButton = false;
  bool goToWelcome = false;
  bool refreshToken = false;

  SplashBloc(/*this.checkUserTokenUseCase, this.editUserDataUseCase,*/)
      : super(const SplashState()) {
    // on<CheckUserTokenEvent>(
    //       (CheckUserTokenEvent event, Emitter<SplashState> emit) async {
    //     emit(
    //       state.copyWith(
    //         checkTokenEventIsFinish: RequestStates.loading,
    //       ),
    //     );
    //     final result = await checkUserTokenUseCase(const NoParameter());
    //     result.fold(
    //           (failure) {
    //         emit(
    //           state.copyWith(
    //             checkTokenEventIsFinish: RequestStates.error,
    //             checkTokenErrorMessage: failure.message,
    //           ),
    //         );
    //       },
    //           (success) {
    //         emit(state.copyWith(
    //           checkTokenEventIsFinish: RequestStates.loaded,
    //           isValidToken: success,
    //         ));
    //
    //
    //       },
    //     );
    //   },
    // );

    // on<CheckDevice>((CheckDevice event, Emitter<SplashState> emit) async {
    //   emit(state.copyWith(
    //     checkIsRealDevice: PhysicalDeviceState.loading,
    //   ),);
    //
    //   try {
    //     if (AppReference.deviceIsAndroid) {
    //       final androidInfo = await AppReference.deviceInfoPlugin.androidInfo;
    //       if (androidInfo.isPhysicalDevice) {
    //         emit(state.copyWith(
    //           checkIsRealDevice: PhysicalDeviceState.isRealDevice,
    //         ),);
    //       } else {
    //         emit(state.copyWith(
    //           checkIsRealDevice: PhysicalDeviceState.isEmulator,
    //         ),);
    //       }
    //     } else if (AppReference.deviceIsIos) {
    //       final iosInfo = await AppReference.deviceInfoPlugin.iosInfo;
    //       if (iosInfo.isPhysicalDevice) {
    //         emit(state.copyWith(
    //           checkIsRealDevice: PhysicalDeviceState.isRealDevice,
    //         ),);
    //       } else {
    //         emit(state.copyWith(
    //           checkIsRealDevice: PhysicalDeviceState.isEmulator,
    //         ),);
    //       }
    //     } else {
    //       emit(state.copyWith(
    //         checkIsRealDevice: PhysicalDeviceState.isEmulator,
    //       ),);
    //     }
    //   } catch (e) {
    //     emit(state.copyWith(
    //       checkIsRealDevice: PhysicalDeviceState.error,
    //     ),);
    //   }
    // });

    // on<EditUserDataEvent>(
    //       (EditUserDataEvent event, Emitter<SplashState> emit) async {
    //     emit(
    //       state.copyWith(
    //         editUseDataEventIsFinish: RequestStates.loading,
    //       ),
    //     );
    //     final result = await editUserDataUseCase(const NoParameter());
    //     result.fold(
    //           (failure) {
    //         emit(
    //           state.copyWith(
    //             editUseDataEventIsFinish: RequestStates.error,
    //             editUseDataErrorMessage: failure.message,
    //           ),
    //         );
    //       },
    //           (success) async {
    //             final userDate = getIt<UserLocalDataSource>().getUserData();
    //             if (userDate != null) {
    //               getIt<UserLocalDataSource>().saveUserData(
    //                 userModel: success,
    //               );
    //             }
    //         emit(state.copyWith(
    //           editUseDataEventIsFinish: RequestStates.loaded,
    //         ));
    //       },
    //     );
    //   },
    // );
  }
}
