enum ToastStates { congrats, error, info, warning }

enum RequestStates { initial, loading, loaded, error }

enum PhysicalDeviceState { initial, loading, error,isRealDevice, isEmulator }

enum DeveloperModeState { initial,loading,error,disabled, enabled }

enum FormattedAppState { initial,loading,error,loaded }

enum BasicDialogStatus { retry, success, failed, halfSuccess }

enum UsersType { child, parent, institution }

enum SendType { phone, email }

enum SkillType { success, failed }

enum GenderType { male, female, other }

enum HomeLayoutStatesEnum {
  homeLayoutInitState,
  changeBottomNavState,
  appFlowState,
}

enum PickImageState {
  init,
  startLoadingImage,
  imagePickedSuccessfully,
  imagePickedError,
  imagePickedInValidFormat,
}

enum QuestionsStates {
  initialQuestion,
  wrongAnswer,
  questionDone,
  halfQuestionDone,
  finishedAllQuestions,
  showHint,
  showRetryDialog,
  answeredFromFirstTry,
}

enum GradeStates {
  init,
  changeStageState,
  changeClassRoomState,
  changeTermState,
}

enum SendTimeState {
  init,
  loading,
  sendSuccessfully,
}

enum StartTimeState {
  init,
  loading,
  sendSuccessfully,
}

enum ChangeTafseerStates{
  initial,
  changeAyaState,
}


enum StringType { english, arabic, quranicArabic, unknown }

enum SubjectType { public, subscriptions }

enum ImageSourceType { gallery, camera }

enum PickImageShape {
  item,
  dialog,
  bottomSheet,
}

enum Availability { loading, available, unavailable }
