import 'package:chat/core/enum/enum_generation.dart';
import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../data/model/app_version_model.dart';

class GlobalState extends Equatable {
  final SendTimeState sendTimeState;
  final StartTimeState startTimeSetState;
  final RequestStates getGuestDataState;
  final UserEntity? guestData;
  final RequestStates checkAppVersionState;
  final AppVersionModel appVersionModel;
  final InfoModel infoModel;
  final RequestStates infoState;

  const GlobalState({
    this.sendTimeState = SendTimeState.init,
    this.getGuestDataState = RequestStates.initial,
    this.guestData,
    this.checkAppVersionState = RequestStates.initial,
    this.appVersionModel = const AppVersionModel(
      appVersion: 0,
      androidLink: '',
      iosLink: '',
      isReview: false,
      inReview2: false,
      appRepairing: false,
      appRequiredUpdate: false,
      appHaveUpdate: false,
      enablePurchase: false,
      enableNafees: false,
      invitationStatus: false,
    ),
    this.startTimeSetState = StartTimeState.init,
    this.infoState = RequestStates.initial,
    this.infoModel = const InfoModel(
      androidLink: '',
      iosLink: '',
      apkVersion: "",
      iosVersion: "",
      splashView: false,
    ),
  });

  GlobalState copyWith({
    SendTimeState? sendTimeState,
    RequestStates? getGuestDataState,
    UserEntity? guestData,
    RequestStates? checkAppVersionState,
    AppVersionModel? appVersionModel,
    DeveloperModeState? checkDeveloperModeState,
    StartTimeState? startTimeSetState,
    InfoModel? infoModel,
    RequestStates? infoState,
  }) {
    return GlobalState(
      sendTimeState: sendTimeState ?? this.sendTimeState,
      getGuestDataState: getGuestDataState ?? this.getGuestDataState,
      guestData: guestData ?? this.guestData,
      checkAppVersionState: checkAppVersionState ?? this.checkAppVersionState,
      appVersionModel: appVersionModel ?? this.appVersionModel,
      startTimeSetState: startTimeSetState ?? this.startTimeSetState,
      infoModel: infoModel ?? this.infoModel,
      infoState: infoState ?? this.infoState,
    );
  }

  @override
  List<Object?> get props => [
        sendTimeState,
        getGuestDataState,
        guestData,
        checkAppVersionState,
        appVersionModel,
        startTimeSetState,
        infoModel,
        infoState
      ];
}
