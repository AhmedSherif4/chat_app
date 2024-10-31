part of 'app_settings_cubit.dart';

abstract class AppSettingsState extends Equatable {
  const AppSettingsState();
}

class AppSettingsInitial extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class ChangeLocale extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class SetTheme extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class GetTheme extends AppSettingsState {
  @override
  List<Object> get props => [];
}
