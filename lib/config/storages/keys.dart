class AppKeys {
  static const String onBoardingViewed = 'onBoardingViewed';
  static const String showcaseViewed = 'showcaseViewed';
  static const String correctAnswerViewed = 'correctAnswerView';
  static const String bannerViewed = 'bannerViewed';

  static const String androidVersion = '1';
  static const String iosVersion = '1';

  //! keys for local data
  static const String userData = 'userData';
  static const String accessToken = 'accessToken';

  // static const String subjectsKey = 'subjects_key';
  static const String cartItemsKey = 'cart_items_key';
  static const String termsAndConditions = 'terms_and_conditions';
  static const String contactUs = 'contact_us';

  static const String puzzleAndAdviceKey = 'puzzle_and_advice_key';

  static String quranPageKey(String pageNumber) => 'quran_page_key$pageNumber';

  static String subjectsKey({
    required int stageId,
    required int classRoomId,
    required int termId,
    required int pathId,
  }) =>
      'child_subjects_key_for_stage_id_${stageId}_classRoomId_${classRoomId}_termId$termId';

  static String childSubscriptionSubjectsKey({
    required int stageId,
    required int classRoomId,
    required int termId,
    required int childId,
  }) =>
      'child_Subscription_for_${childId}_${stageId}_classRoomId_${classRoomId}_termId$termId';

  static String childSubscriptionsStagesKey({required int childId}) =>
      'child_subscriptions_stages_for_$childId';

  static String childSubscriptionsClassRoomsKey({
    required int stageId,
    required int childId,
  }) =>
      'child_subscriptions_classrooms_key_for_${childId}_for_stage_id_$stageId';

  static String childSubscriptionsTermsKey({
    required int stageId,
    required int classRoomId,
    required int childId,
  }) =>
      'child_subscriptions_terms_key_for_${childId}_for_stage_id_${stageId}_classRoomId_$classRoomId';

  static String levelsKey(int subjectID) => 'levels_key_per_subject_$subjectID';
  static const String parentsForChild = 'parents_for_child';
  static const String commonQuestions = 'commonQuestions';

  static String lessonsKey(int subjectId) =>
      'subject_id_${subjectId}_lessons_key';

  static String lessonsByUnitsKey(int subjectId) =>
      'subject_id_${subjectId}_lessons_by_units_key';

  static String collectionKey(int levelID) =>
      'level_id_${levelID}_collection_key';

  static String examsKey(int subjectId) =>
      'subject_id_${subjectId}_lessons_key';

  static String getExpirationKey(String labelKey) => '$labelKey' '_expiration';

  static const String childKey = 'child';
  static const String parentKey = 'parent';
  static const String institutionKey = 'institution';

  //! to questions' and answers' types
  static const String imageKey = 'img';
  static const String audioKey = 'audio';
  static const String videoKey = 'video';
  static const String textFieldKey = 'textField';
  static const String textKey = 'text';

  static const String appStoreIdKey = '6477544252';
}
