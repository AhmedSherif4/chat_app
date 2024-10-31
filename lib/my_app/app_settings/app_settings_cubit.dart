import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../config/base_local_data_source/app_preferences.dart';

part 'app_settings_state.dart';

@Injectable()
class AppSettingsCubit extends Cubit<AppSettingsState> {
  final AppPreferences _appPreferences;

  AppSettingsCubit(this._appPreferences) : super(AppSettingsInitial());

  void changeLocaleEvent() {
    _appPreferences.changeLocale();
    emit(ChangeLocale());
  }

  setThemeMode(bool value) {
    _appPreferences.setThemeMode(value);
    emit(SetTheme());
  }

  bool getThemeMode() {
    emit(GetTheme());
    return _appPreferences.isDarkModeOn();
  }
}
