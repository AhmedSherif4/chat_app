class EndPoints {
  static const String baseUrl = 'https://test.tasesy.com';
  // static const String baseUrl = 'https://taseese.org';
  // static const String baseUrl = 'https://t.rhmany.com';

  static String imagePath(String imgPath) => '$baseUrl$imgPath';

  static const String checkTokenPath = '/api/check/token';
  static const String paymentDataPath = '/api/payment/data';
  static const String logout = '/api/logout';
  static const String sendTimeInApp = '/api/add/minutes';
  static const String addClassroomToCartPath = '/api/add/classroom/cart';
  static const String addTransaction = '/api/add/transaction/if/zero';
  static const String nafeesZero = '/api/pay/nafis/if/zero';
  static const String simulatedZero = '/api/pay/tahsilia/if/zero';
  static const String parentAddClassroomToCartPath =
      '/api/parent/add/classroom/cart';
  static const String addTermToCartPath = '/api/add/term/cart';
  static const String addSubjectOptionalClassroom =
      '/api/add/subject/optional/classroom';
  static const String addSubjectOptionalTerm = '/api/add/subject/optional/term';
  static const String parentAddTermToCartPath = '/api/parent/add/term/cart';
  static const String addSubjectToCartPath = '/api/add/subject/cart';
  static const String parentAddSubjectToCartPath =
      '/api/parent/add/subject/cart';
  static const String checkVersion = '/api/check/version';
  static const String getGuestData = '/api/guest';
  static const String parentUpdateNotification =
      '/api/parent/update/notifications';
  static const String institutionUpdateNotification =
      '/api/institution/update/notifications';

  // public path
  static const String systemPath = '/api/public/systems';
  static const String pathPath = '/api/public/paths';
  static const String stagesPath = '/api/public/stages';
  static const String classroomsPath = '/api/public/classrooms';
  static const String termsPath = '/api/public/terms';
  static const String subjects = '/api/public/subjects';

  // auth path
  static const String loginPath = '/api/login';
  static const String termsAndConditionsPath = '/api/privacy/policy';
  static const String contactUsPath = '/api/info';
  static const String forgotPasswordPath = '/api/forgot/password';
  static const String sendVerificationCodePath = '/api/send/verification/code';
  static const String checkVerificationCodePath =
      '/api/check/verification/code';
  static const String signUpPath = '/api/register';
  static const String parentAddNewChildPath = '/api/add/child/not/exists';
  static const String parentAddExistChildPath = '/api/add/child/exists';
  static const String socialLoginPath = '/api/social/login';
  static const String socialRegisterPath = '/api/social/register';
  static const String changePasswordPath = '/api/change/password';
  static const String parentChangePasswordPath = '/api/change/parent/password';
  static const String institutionChangePasswordPath =
      '/api/institution/change/password';

  // child flow path
  static const String gradeSelectionPath = '/api/add/term';
  static const String timeInAppPath = '/api/time/inside/app';
  static const String parentTimeInAppPath = '/api/child/time/inside/app';
  static const String institutionTimeInAppPath =
      '/api/institution/child/time/inside/app';
  static const String subjectsForStatics = '/api/subjects/any/answer';
  static const String institutionSubjectsForStatics =
      '/api/institution/child/subjects/any/answer';
  static const String parentSubjectsForStatics =
      '/api/child/subjects/any/answer';
  static const String lessonsStaticsPath = '/api/lessons/stats';
  static const String institutionLessonsStaticsPath =
      '/api/institution/child/lessons/stats';
  static const String parentChildLessonsStaticsPath =
      '/api/child/lessons/stats';
  static const String levelStaticsPath = '/api/groups/stats';
  static const String parentLevelStaticsPath = '/api/child/groups/stats';
  static const String institutionLevelStaticsPath =
      '/api/institution/child/groups/stats';
  static const String failsSkillsForLessonsPath = '/api/skills/fails/question';
  static const String failsSkillsQuestionPath = '/api/get/question';
  static const String parentFailsSkillsForLessonsPath =
      '/api/child/skills/fails/question';
  static const String institutionFailsSkillsForLessonsPath =
      '/api/institution/child/skills/fails/question';
  static const String failsQuestionBySkillForLessonPath =
      '/api/get/skill/questions';
  static const String parentFailsQuestionBySkillForLessonPath =
      '/api/child/get/skill/questions';
  static const String institutionFailsQuestionBySkillForLessonPath =
      '/api/institution/child/get/skill/questions';
  static const String bestSubjectsPath = '/api/best/subjects';
  static const String parentBestSubjectsPath = '/api/child/best/subjects';
  static const String institutionBestSubjectsPath =
      '/api/institution/child/best/subjects';

  // ChildSubscriptions
  static const String childSubscriptionsStagesPath =
      '/api/subscriptions/stages';
  static const String childSubscriptionsSystemPath =
      '/api/subscriptions/systems';
  static const String parentChildSubscriptionsSystemPath =
      '/api/child/subscriptions/systems';
  static const String parentChildSubscriptionsStagesPath =
      '/api/child/subscriptions/stages';
  static const String institutionChildSubscriptionsSystemPath =
      '/api/institution/child/subscriptions/systems';
  static const String institutionChildSubscriptionsStagesPath =
      '/api/institution/child/subscriptions/stages';
  static const String childSubscriptionsClassroomsPath =
      '/api/subscriptions/classrooms';
  static const String parentChildSubscriptionsClassroomsPath =
      '/api/child/subscriptions/classrooms';
  static const String institutionChildSubscriptionsClassroomsPath =
      '/api/institution/child/subscriptions/classrooms';
  static const String childSubscriptionsTermsPath = '/api/subscriptions/terms';
  static const String childSubscriptionsPathsPath = '/api/subscriptions/paths';
  static const String parentChildSubscriptionsTermsPath =
      '/api/child/subscriptions/terms';
  static const String parentChildSubscriptionsPathsPath =
      '/api/child/subscriptions/paths';
  static const String institutionChildSubscriptionsTermsPath =
      '/api/institution/child/subscriptions/terms';
  static const String institutionChildSubscriptionsPathsPath =
      '/api/institution/child/subscriptions/paths';
  static const String childSubscriptionsSubjectsPath =
      '/api/subscriptions/subjects';
  static const String parentChildSubscriptionsSubjectsPath =
      '/api/child/subscriptions/subjects';
  static const String institutionChildSubscriptionsSubjectsPath =
      '/api/institution/child/subscriptions/subjects';

  static const String reportQuestionPath = '/api/report/question';
  static const String childAddNewParentPath = '/api/add/parent/not/exists';
  static const String childAddExistParentPath = '/api/add/parent/exists';
  static const String rankStage = '/api/rank/stage';
  static const String parentNotification = '/api/parent/notifications';
  static const String childNotification = '/api/child/notifications';
  static const String institutionNotification =
      '/api/institution/notifications';
  static const String institutionReadAllNotification =
      '/api/institution/read/all/notifications';
  static const String parentReadAllNotification =
      '/api/parent/read/all/notifications';
  static const String childReadAllNotification =
      '/api/child/read/all/notifications';
  static const String parentRankStage = '/api/child/rank/stage';
  static const String institutionRankStage =
      '/api/institution/child/rank/stage';
  static const String rankClassroom = '/api/rank/classroom';
  static const String parentRankClassroom = '/api/child/rank/classroom';
  static const String institutionRankClassroom =
      '/api/institution/child/rank/classroom';
  static const String rankTerm = '/api/rank/term';
  static const String parentRankTerm = '/api/child/rank/term';
  static const String institutionRankTerm = '/api/institution/child/rank/term';
  static const String rankSubject = '/api/rank/subject';
  static const String institutionRankSubject =
      '/api/institution/child/rank/subject';
  static const String parentRankSubject = '/api/child/rank/subject';
  static const String puzzle = '/customers/puzzle';
  static const String tipOfTheDay = '/customers/tip_of_the_day';
  static const String parentSubjects = '/api/parent/subjects';
  static const String institutionSubjects = '/api/institution/subjects';
  static const String puzzleAndAdvice = '/api/enigma';
  static const String allSubscription = '/api/my/all/subscriptions';
  static const String parentAllSubscription = '/api/child/all/subscriptions';
  static const String institutionAllSubscription =
      '/api/institution/child/all/subscriptions';
  static const String levels = '/api/levels';
  static const String levelsFromParent = '/api/parent/levels';
  static const String institutionFromParent = '/api/institution/levels';
  static const String collections = '/api/groups';
  static const String lessons = '/api/lessons';
  static const String parentsForChild = '/api/my/parents';
  static const String commonQuestions = '/api/faqs';
  static const String lessonsQuestions = '/api/lessons/questions';
  static const String generalQuestions = '/api/general/questions';
  static const String exams = '/api/exams';
  static const String uploadExam = '/api/upload/exam';
  static const String checkCoupon = '/api/check/coupon';
  static const String checkCart = '/api/check/cart';
  static const String editProfile = '/api/update/child/data';
  static const String parentEditProfile = '/api/update/parent/data';
  static const String institutionEditProfile = '/api/institution/update/data';
  static const String baseUrlForQuran = 'https://api.alquran.cloud/v1/';

  //parent
  static const String allChildForParentPath = '/api/my/children';
  static const String deleteCartPath = '/api/delete/cart';
  static const String parentDeleteCartPath = '/api/parent/delete/cart';
  static const String viewCartPath = '/api/view/cart';
  static const String parentViewCartPath = '/api/parent/view/cart';
  static const String childUnLinkParentPath = '/api/unlink/parent';
  static const String parentUnLinkChildPath = '/api/unlink/child';
  static const String institutionAllChildForParentPath =
      '/api/institution/parent/children';
  static const String allParentsForInstitutionPath = '/api/institution/parents';
  static const String institutionAddNewParent = '/api/institution/add/parent';
  static const String institutionAddNewChild = '/api/institution/add/child';
  static const String parentAddNewChild = '/api/parent/create/child';
  static const String getPlansPath = '/api/plans';
  static const String parentGetPlansPath = '/api/parent/plans';
  static const String getSubjectsPlansPath = '/api/plan/categories';
  static const String getLessonSubjectsPlansPath = '/api/plan/lessons';
  static const String getNafeesQuestionsPlansPath =
      '/api/plan/lesson/questions';
  static const String planLessonsStats = '/api/plan/lessons/stats';
  static const String parentPlanLessonsStats = '/api/parent/plan/lessons/stats';

  //cart-new
  static const String addSubjectPath = '/api/add/subject/cart';
  static const String parentAddSubjectPath = '/api/parent/add/subject/cart';
  static const String deleteSubjectPath = '/api/delete/subject';
  static const String parentDeleteSubjectPath = '/api/parent/delete/subject';
  static const String addOptionalSubjectPath = '/api/add/subject/optional';
  static const String parentAddOptionalSubjectPath =
      '/api/parent/add/subject/optional';
  static const String getCartClassroomPath = '/api/get/classrom';
  static const String parentGetCartClassroomPath = '/api/parent/get/classrom';

  //child review
  static const String childAddReviewPath = '/api/child/add/review';
  static const String childDeleteReviewPath = '/api/child/delete/review';
  static const String childAllReviewPath = '/api/child/reviews';

  //parent review
  static const String parentAddReviewPath = '/api/parent/add/review';
  static const String parentDeleteReviewPath = '/api/parent/delete/review';
  static const String parentAllReviewPath = '/api/parent/reviews';

//institution review
  static const String institutionAddReviewPath = '/api/parent/add/review';
  static const String institutionDeleteReviewPath = '/api/parent/delete/review';
  static const String institutionAllReviewPath = '/api/parent/reviews';

  //random exams
  static const String createRandomExamsPath = '/api/createRandomExam';
  static const String repeatRandomExamsPath = '/api/repeatRandomExams';
  static const String allRandomExamsPath = '/api/child/randomExams';
  static const String parentAllRandomExamsPath = '/api/parent/randomExams';
  static const String addRandomQuestionAnswerPath =
      '/api/add/random/question/answer';

  static const String allCouponsPath = '/api/child/coupons';
  static const String bannerPath = '/api/banners';
  static const String invitationPath = '/api/invitation/point';
  static const String mePath = '/api/me';

  ///NAFEES API
  static const String nafeesPlans = '/api/nafis';
  static const String nafeesExams = '/api/nafis_get_exam';
  static const String nafeesModelAnswers = '/api/nafis_get_model_answers';
  static const String nafeesStoreExamAnswer = '/api/nafis_store_exam_answer';

  ///simulated API
  static const String simulatedPlans = '/api/tahsilia';
  static const String simulatedExams = '/api/tahsilia_get_exam';
  static const String simulatedModelAnswers = '/api/tahsilia_get_model_answers';
  static const String simulatedStoreExamAnswer = '/api/tahsilia_store_exam_answer';
}
