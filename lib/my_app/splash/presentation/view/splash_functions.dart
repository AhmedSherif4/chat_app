part of '../../splash_screen.dart';

void _showRepairingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => RepairDialog(onTap: (value) {
            SystemNavigator.pop();
          }));
}

// bool _appInProductionAndNotUpdateToLastVersion() {
//   return BlocProvider.of<GlobalBloc>(context)
//           .state
//           .appVersionModel
//           .appVersion !=
//       AppKeys.appVersion;
// }

// bool _appInReview() {
//   return BlocProvider.of<GlobalBloc>(context).state.appVersionModel.isReview;
//   // return true;
// }

// bool _splashScreenInReview() {
//   return BlocProvider.of<GlobalBloc>(context).state.infoModel.splashView;
//   // return true;
// }

bool _appHaveUpdate(BuildContext context) {
  return BlocProvider.of<GlobalBloc>(context)
      .state
      .appVersionModel
      .appHaveUpdate;
}

bool _appHaveLastVersion(BuildContext context) {
  return BlocProvider.of<GlobalBloc>(context).state.infoModel.apkVersion ==
      AppKeys.androidVersion;
}

bool _appRequiredUpdate(BuildContext context) {
  return BlocProvider.of<GlobalBloc>(context)
      .state
      .appVersionModel
      .appRequiredUpdate;
}

bool _appRepairing(BuildContext context) {
  return BlocProvider.of<GlobalBloc>(context)
      .state
      .appVersionModel
      .appRepairing;
}

Future<bool> _getOnBoardingStatus() async {
  return false;
  // return await getIt<OnBoardingLocalData>().getOnBoardingValue();
}

Future<UserEntity?> _getUserData() async {
  return getIt<UserLocalDataSource>().getUserData();
}

// void _checkAppVersion() {
//   if (mounted) {
//     context.read<GlobalBloc>().add(CheckAppVersionEvent());
//   }
// }

void _goToWelcomeScreen(BuildContext context) {
  Navigator.pushReplacementNamed(
    context,
    AppRoutesNames.rWelcome,
  );
}

void _checkOnBoardingIsViewed(BuildContext context, bool onBoardingStatus) {
  if (onBoardingStatus) {
    _goToWelcomeScreen(context);
  } else {
    Navigator.pushReplacementNamed(
      context,
      AppRoutesNames.rOnBoardingScreen,
    );
  }
}

void _goToHomeScreen(
  BuildContext context,
  /*UserEntity? userData*/
) {
  Navigator.pushReplacementNamed(
    context,
    AppRoutesNames.rLoginScreen,
  );
}

void _checkNextScreenAfterSplashFromDeepLink(bool isValidToken) {
  // if (widget.path!.contains('/home') && isValidToken) {
  //   navigatorKey.currentState!.pushReplacementNamed(
  //       AppRoutesNames.rHomeLayoutView,
  //       arguments: userData);
  // } else if(widget.path!.contains('/coupons') && isValidToken){
  //   navigatorKey.currentState!.pushNamed(
  //     AppRoutesNames.rCouponsScreen,
  //   );
  // }else if(widget.path!.contains('/reviews') && isValidToken){
  //   navigatorKey.currentState!.pushNamed(
  //       AppRoutesNames.rReviewScreen);
  // }else if (widget.path!.contains('/addExitChild') &&
  //     widget.id != null &&
  //     isValidToken) {
  //   if (AppReference.userIsParent()) {
  //     navigatorKey.currentState!.pushNamed(
  //       AppRoutesNames.rParentAddExistChildScreen,
  //       arguments: '${widget.id}',
  //     );
  //   } else {
  //     navigatorKey.currentState!.pushNamed(
  //       AppRoutesNames.rHomeLayoutView,
  //       arguments: userData,
  //     );
  //   }
  // } else if (widget.path!.contains('/lessons') && widget.id != null) {
  //   navigatorKey.currentState!.pushNamed(AppRoutesNames.rLessonScreen,
  //       arguments: DataToGoQuestions(
  //           imgUrl: '',
  //           notHaveImage: true,
  //           subjectName: 'no',
  //           stageId: 1,
  //           classRoomId: 1,
  //           termId: 1,
  //           subjectId: int.tryParse(widget.id!)!,
  //           isPrimary: true,
  //           systemId: 1));
  // } else if (widget.path!.contains('/subscriptions') &&
  //     widget.id != null &&
  //     AppReference.userIsChild()) {
  //   navigatorKey.currentState!.pushReplacementNamed(
  //       AppRoutesNames.rFreeSubscriptionsScreen,
  //       arguments: userData);
  // } else {
  //   navigatorKey.currentState!.pushReplacementNamed(AppRoutesNames.rWelcome);
  // }
}

void _checkNextScreenAfterSplash(
    bool isValidToken, UserEntity? userData, BuildContext context) {
  // switch (isValidToken) {
  //   case true:
  //     if (userData == null) {
  //       _goToWelcomeScreen(context);
  //     } else {
  //       if (userData!.type == UsersType.child.name) {
  //         _checkChildHaveStageOrNot(context, userData);
  //       } else {
  //         _goToHomeScreen(context);
  //       }
  //     }
  //   case false:
  //     _goToWelcomeScreen(context);
  // }
}

void _updateDialogOnTap({
  required String androidLink,
  required String iosLink,
}) {
  launchUrl(
    AppReference.deviceIsAndroid ? Uri.parse(androidLink) : Uri.parse(iosLink),
  );
}

_splashListener(context, state, mounted, widget, userData) {
  (context, state) async {
    switch (state.checkTokenEventIsFinish) {
      case RequestStates.loaded:
        if (AppReference.userIsGuest()) {
          _goToWelcomeScreen(context);
        } else {
          if (widget.path != null) {
            _checkNextScreenAfterSplashFromDeepLink(state.isValidToken);
          } else {
            _checkNextScreenAfterSplash(state.isValidToken, userData, context);
          }
        }
      case RequestStates.error:
        showSnackBar(
          description: state.checkTokenErrorMessage,
          state: ToastStates.error,
          context: context,
        );
      // _goToWelcomeScreen();
      default:
      // _goToWelcomeScreen();
    }
    // if (state.checkIsRealDevice == PhysicalDeviceState.isRealDevice) {
    //   showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => PhysicalDebuggingDialog(onTap: (value) {
    //       RouteManager.rPushNamedAndRemoveUntil(
    //           context: context, rName: AppRoutesNames.rSplashScreen);
    //     }),
    //   );
    // }
    // else if (state.checkIsRealDevice == PhysicalDeviceState.isEmulator) {
    // }
  };
}

_globalListener(context, state, mounted) async {
  if (state.checkAppVersionState == RequestStates.loaded) {
    if (!await AppReference.isHuaweiDevice() && mounted) {
      // AppAnalytics.init();
      // AppAnalytics.appOpenedLogEvent();

      if (await getIt<NetworkInfo>().isConnected) {
        // NotificationSetup.notiPermissionRequest().then((value) async {
        //   NotificationSetup.setupInteractedMessage();
        //   if (_appRepairing(context)) {
        //     _showRepairingDialog(context);
        //   } else {
        //     // if (_appHaveLastVersion()) {
        //     //   if (getIt<BaseAppSecurityData>().getToken() == null) {
        //     //     _checkOnBoardingIsViewed();
        //     //   } else {
        //     //     context.read<SplashBloc>().add(CheckUserTokenEvent());
        //     //   }
        //     //
        //     // } else {
        //     if (_appHaveUpdate(context) && !_appHaveLastVersion(context)) {
        //       if (mounted) {
        //         showDialog(
        //           context: context,
        //           barrierDismissible: false,
        //           builder: (_) => PopScope(
        //             canPop: false,
        //             child: UpdateDialog(
        //               onTap: (value) {
        //                 _updateDialogOnTap(
        //                   androidLink: BlocProvider.of<GlobalBloc>(context)
        //                       .state
        //                       .appVersionModel
        //                       .androidLink,
        //                   iosLink: BlocProvider.of<GlobalBloc>(context)
        //                       .state
        //                       .appVersionModel
        //                       .iosLink,
        //                 );
        //               },
        //               canPop: !_appRequiredUpdate(context),
        //             ),
        //           ),
        //         ).then((value) {
        //           if (!_appRequiredUpdate(context)) {
        //             if (getIt<BaseAppSecurityData>().getToken() == null) {
        //               _checkOnBoardingIsViewed(context, false);
        //             } else {
        //               if (context.mounted) {
        //                 context.read<SplashBloc>().add(CheckUserTokenEvent());
        //               }
        //             }
        //           }
        //         });
        //       }
        //     } else {
        //       if (getIt<BaseAppSecurityData>().getToken() == null) {
        //         _checkOnBoardingIsViewed(context, false);
        //       } else {
        //         context.read<SplashBloc>().add(CheckUserTokenEvent());
        //       }
        //     }
        //     // }
        //   }
        // });

        // if (await NotificationSetup.notiPermissionStatus()) {
        //   NotificationSetup.createAndroidLocalNotificationChannel();
        //   if (AppReference.deviceIsIos) {
        //     NotificationSetup.iosBackGroundNotification();
        //   }
        //   await NotificationSetup.messagingPermission.subscribeToTopic("all");
        //   if (kDebugMode) {
        //     await NotificationSetup.messagingPermission
        //         .subscribeToTopic("all-test");
        //   }
        // }
      } else {
        _goToWelcomeScreen(context);
      }
    } else {
      if (mounted) {
        if (_appRepairing(context)) {
          _showRepairingDialog(context);
        } else {
          // if (_appHaveLastVersion()) {
          //   if (getIt<BaseAppSecurityData>().getToken() == null) {
          //     _checkOnBoardingIsViewed();
          //   } else {
          //     context.read<SplashBloc>().add(CheckUserTokenEvent());
          //   }
          //
          // } else {
          if (_appHaveUpdate(context) && !_appHaveLastVersion(context)) {
            if (mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => PopScope(
                  canPop: false,
                  child: UpdateDialog(
                    onTap: (value) {
                      _updateDialogOnTap(
                        androidLink: BlocProvider.of<GlobalBloc>(context)
                            .state
                            .appVersionModel
                            .androidLink,
                        iosLink: BlocProvider.of<GlobalBloc>(context)
                            .state
                            .appVersionModel
                            .iosLink,
                      );
                    },
                    canPop: !_appRequiredUpdate(context),
                  ),
                ),
              ).then((value) {
                if (!_appRequiredUpdate(context)) {
                  if (getIt<BaseAppSecurityData>().getToken() == null) {
                    _checkOnBoardingIsViewed(context, false);
                  } else {
                    if (context.mounted) {
                      context.read<SplashBloc>().add(CheckUserTokenEvent());
                    }
                  }
                }
              });
            }
          } else {
            if (getIt<BaseAppSecurityData>().getToken() == null) {
              _checkOnBoardingIsViewed(context, false);
            } else {
              context.read<SplashBloc>().add(CheckUserTokenEvent());
            }
          }
          // }
        }
      }
    }
  }
}
