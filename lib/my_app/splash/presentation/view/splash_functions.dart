part of '../../splash_screen.dart';

void _goToHomeOrLoginScreen(
  BuildContext context,
) {
  final bool isAuthed =
      (getIt<UserLocalDataSource>().getUserData()?.userId?.isNotEmpty ??
          false || getIt<UserLocalDataSource>().getUserData()?.userId == '');
  switch (isAuthed) {
    case true:
      if (getIt<AppPreferences>().getUserDataAddedStatus()) {
        Navigator.pushReplacementNamed(context, AppRoutesNames.rHomeScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutesNames.rFillUserData);
      }
      break;
    case false:
      Navigator.pushReplacementNamed(context, AppRoutesNames.rLoginScreen);
      break;
  }
}
