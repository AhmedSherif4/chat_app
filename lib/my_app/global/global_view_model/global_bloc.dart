import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'global_event.dart';
import 'global_state.dart';

class DeveloperModeChecker {
  static const EventChannel _eventChannel =
      EventChannel('developer_mode_stream');

  // Expose the stream to the Flutter side
  static Stream<bool> get developerModeStream {
    return _eventChannel.receiveBroadcastStream().map((event) {
      try {
        return event as bool;
      } catch (e) {
        // print('Error processing stream event: $e');
        return false;
      }
    });
  }
}

@Injectable()
class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  // final SendTimeUseCase sendTimeUseCase;
  // final GetGuestDataUseCase getGuestData;
  // final CheckAppVersionUseCase checkAppVersionUseCase;
  // final GetInfoUseCase getInfoUseCase;

  bool isLogoutButton = false;
  bool goToWelcome = false;
  bool refreshToken = false;
  bool fromRegister = false;

  GlobalBloc(// this.sendTimeUseCase,
      //   // this.getGuestData,
      //   this.checkAppVersionUseCase, this.getInfoUseCase,
      )
      : super(const GlobalState()) {
    // on<SendTimeInAppEvent>(
    //     (SendTimeInAppEvent event, Emitter<GlobalState> emit) async {
    //   emit(state.copyWith(
    //     sendTimeState: SendTimeState.loading,
    //   ));
    //   AppTimeData.setEndTime(DateTime.now());
    //   final result = await sendTimeUseCase(
    //     AppTimeData.endTimeGetter()
    //                 .difference(AppTimeData.startTimeGetter())
    //                 .inMinutes <= 0 ? 1
    //         : AppTimeData.endTimeGetter()
    //             .difference(AppTimeData.startTimeGetter())
    //             .inMinutes,
    //   );
    //   result.fold(
    //     (l) {},
    //     (r) {
    //       emit(
    //         state.copyWith(
    //           sendTimeState: SendTimeState.sendSuccessfully,
    //         ),
    //       );
    //     },
    //   );
    // });

    // on<GetGuestDataEvent>(
    //     (GetGuestDataEvent event, Emitter<GlobalState> emit) async {
    //   emit(state.copyWith(
    //     sendTimeState: SendTimeState.init,
    //     getGuestDataState: RequestStates.loading,
    //   ));
    //   final result = await getGuestData(const NoParameter());
    //   result.fold(
    //     (l) {
    //       emit(
    //         state.copyWith(
    //           getGuestDataState: RequestStates.error,
    //         ),
    //       );
    //     },
    //     (r) {
    //       emit(
    //         state.copyWith(
    //           getGuestDataState: RequestStates.loaded,
    //           guestData: r.user,
    //         ),
    //       );
    //     },
    //   );
    // });

    // on<CheckAppVersionEvent>(
    //         (CheckAppVersionEvent event, Emitter<GlobalState> emit) async {
    //       emit(state.copyWith(
    //         checkAppVersionState: RequestStates.loading,
    //       ));
    //       final result = await checkAppVersionUseCase(const NoParameter());
    //       result.fold(
    //             (l) {
    //           emit(
    //             state.copyWith(
    //               checkAppVersionState: RequestStates.error,
    //             ),
    //           );
    //         },
    //             (r) {
    //           emit(
    //             state.copyWith(
    //               checkAppVersionState: RequestStates.loaded,
    //               appVersionModel: r,
    //             ),
    //           );
    //         },
    //       );
    //     });

    // on<GetInfoDataEvent>(
    //         (GetInfoDataEvent event, Emitter<GlobalState> emit) async {
    //       // emit(state.copyWith(
    //       //   checkAppVersionState: RequestStates.loading,
    //       // ));
    //       final result = await getInfoUseCase(const NoParameter());
    //       result.fold(
    //             (l) {
    //           emit(
    //             state.copyWith(
    //               infoState: RequestStates.error,
    //             ),
    //           );
    //         },
    //             (r) {
    //           emit(
    //             state.copyWith(
    //               infoState: RequestStates.loaded,
    //               infoModel: r,
    //             ),
    //           );
    //         },
    //       );
    //     });

    // on<StartTimeSet>((StartTimeSet event, Emitter<GlobalState> emit) {
    //   emit( state.copyWith(
    //     startTimeSetState: StartTimeState.loading,
    //   ),);
    //   AppTimeData.setEndTime(DateTime.now());
    //   AppTimeData.endTimeGetter()
    //       .difference(AppTimeData.startTimeGetter())
    //       .inMinutes <= 3
    //       ? null
    //       : getIt<SendTimeUseCase>()
    //       .call(
    //     AppTimeData.endTimeGetter()
    //         .difference(AppTimeData.startTimeGetter())
    //         .inMinutes,
    //   )
    //       .then((value) {})
    //       .catchError((onError) {});
    //   emit( state.copyWith(
    //     startTimeSetState: StartTimeState.sendSuccessfully,
    //   ),);
    // });
    //
  }
}
