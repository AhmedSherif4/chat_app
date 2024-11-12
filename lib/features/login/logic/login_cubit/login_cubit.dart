import 'package:chat/config/base_local_data_source/app_preferences.dart';
import 'package:chat/config/extensions/color_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enum/enum_generation.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../../../core/shared_models/user/user_model/user_model.dart';
import '../../login.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final LoginBaseRepository _loginRepository;
  final AppPreferences _appPreferences;

  LoginCubit(this._loginRepository, this._appPreferences) : super(LoginState());

  Future<void> getCodeWithPhoneNumber(String phoneNumber) async {
    emit(state.copyWith(verifyPhoneNumberStatus: RequestStates.loading));
    final result = await _loginRepository.getCodeWithPhoneNumber(phoneNumber);
    result.fold(
      (failure) {
        'failure cubit'.log();
        emit(
          state.copyWith(
              verifyPhoneNumberStatus: RequestStates.error,
              error: failure.message),
        );
      },
      (data) {
        'success cubit'.log();
        emit(
          state.copyWith(verifyPhoneNumberStatus: RequestStates.loaded),
        );
      },
    );
  }

  Future<void> validateOtpAndLogin(String smsCode) async {
    emit(state.copyWith(validateOtpAndLoginStatus: RequestStates.loading));
    try {
      final result = await _loginRepository.validateOtpAndLogin(smsCode);
      result.fold(
        (failure) => emit(
          state.copyWith(
              validateOtpAndLoginStatus: RequestStates.error,
              error: failure.message),
        ),
        (data) async {
          emit(
            state.copyWith(
              validateOtpAndLoginStatus: RequestStates.loaded,
              user: data,
            ),
          );
          getIt<UserLocalDataSource>().getUserData().log();
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
            validateOtpAndLoginStatus: RequestStates.error,
            error: e.toString()),
      );
    }
  }

  onKeyboardTap(String value) {
    emit(
      state.copyWith(
        text: state.text + value,
        validateOtpAndLoginStatus: RequestStates.initial,
        verifyPhoneNumberStatus: RequestStates.initial,
      ),
    );
  }

  rightButtonFn() {
    emit(state.copyWith(text: state.text.substring(0, state.text.length - 1)));
  }

  Future<void> saveUserData(UserModel user) async {
    final result = await _loginRepository.saveUserData(user);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            saveUserDataStatus: RequestStates.error,
            error: failure.message,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            saveUserDataStatus: RequestStates.loaded,
            user: data,
          ),
        );
        _appPreferences.saveUserDataAddedStatus(true);
        getIt<UserLocalDataSource>().getUserData().log();
      },
    );
  }
}
