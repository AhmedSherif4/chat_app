//! This file is not used in the project
//! for the analytics we are using Firebase Analytics

// import 'package:appsflyer_sdk/appsflyer_sdk.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import '../core/services/services_locator.dart';
// import '../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
//
// class AppAnalytics {
//   const AppAnalytics._internal();
//
//   static const AppAnalytics _instance = AppAnalytics._internal();
//
//   factory AppAnalytics() => _instance;
//
//   static void init() {
//     analytics = FirebaseAnalytics.instance;
//     observer = FirebaseAnalyticsObserver(analytics: analytics);
//     analytics.setAnalyticsCollectionEnabled(true);
//   }
//
//   static late FirebaseAnalytics analytics;
//   static late FirebaseAnalyticsObserver observer;
//   static late AppsFlyerOptions appsFlyerOptions;
//   static late AppsflyerSdk appsflyerSdk;
//
//   static Future<void> initAppsFlyer() async {
//     appsFlyerOptions = AppsFlyerOptions(
//       afDevKey: 'JoJKxi4YEtTMiAV6kdrrFT',
//       appId: '6477544252',
//       showDebug: true,
//       timeToWaitForATTUserAuthorization: 50, // for iOS 14.5
//       disableAdvertisingIdentifier: true, // Optional field
//       disableCollectASA: true, //Optional field
//       manualStart: true,
//     );
//     appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
//     await appsflyerSdk.initSdk(
//       registerConversionDataCallback: true,
//       registerOnAppOpenAttributionCallback: true,
//       registerOnDeepLinkingCallback: true,
//     );
//     appsflyerSdk.startSDK();
//     await appsflyerSdk.logEvent('APP INSTALL', {});
//   }
//
//   static Future<void> loginLogEvent() async {
//     await analytics.logEvent(
//       name: 'user_login',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(screenName: 'user_login',parameters: {
//       'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//       'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//       'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//     },);
//
//   }
//
//   static Future<void> signUpLogEvent() async {
//     await analytics.logEvent(
//       name: 'new_user_sign_up',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(screenName: 'new_user_sign_up',parameters: {
//       'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//       'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//       'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//     },);
//
//   }
//
//   static Future<void> appOpenedLogEvent() async {
//     await analytics.logEvent(
//       name: 'app_opened',
//     );
//     await analytics.logScreenView(screenName: 'Open_App',);
//   }
//
//   static Future<void> viewHomeScreenLogEvent() async {
//     await analytics.logEvent(
//       name: 'user_open_home_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_home_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> viewLessonScreenLogEvent() async {
//     await analytics.logScreenView(
//       screenName: 'user_open_lesson_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_lesson_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> viewGroupScreenLogEvent() async {
//     await analytics.logScreenView(
//       screenName: 'user_open_group_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_group_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> viewQuestionScreenLogEvent() async {
//     await analytics.logScreenView(
//       screenName: 'user_open_question_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_question_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> viewNafeesScreenLogEvent() async {
//     await analytics.logScreenView(
//       screenName: 'user_open_nafees_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_nafees_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> viewCartScreenLogEvent() async {
//     await analytics.logScreenView(
//       screenName: 'user_open_cart_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_cart_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> viewCheckoutScreenLogEvent() async {
//     await analytics.logScreenView(
//       screenName: 'user_open_checkout_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//     await analytics.logScreenView(
//       screenName: 'user_open_checkout_screen',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//       },
//     );
//   }
//
//   static Future<void> logAddClassroomToCart({
//     required String classroomName,
//   }) async {
//     await analytics.logEvent(
//       name: 'user_add_classroom_to_cart',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//         'classroomName': classroomName,
//       },
//     );
//
//     await analytics.logScreenView(
//       screenName: 'user_add_classroom_to_cart',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//         'classroomName': classroomName,
//       },
//     );
//   }
//
//   static Future<void> logAddTermToCart({
//     required String termName,
//   }) async {
//     await analytics.logScreenView(
//       screenName: 'user_add_term_to_cart',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//         'termName': termName,
//       },
//     );
//
//     await analytics.logScreenView(
//       screenName: 'user_add_term_to_cart',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//         'termName': termName,
//       },
//     );
//   }
//
//   static Future<void> logAddSubjectToCart({
//     required String subjectName,
//   }) async {
//     await analytics.logScreenView(
//       screenName: 'user_add_subject_to_cart',
//       parameters: {
//         'user name': getIt<UserLocalDataSource>().getUserData()!.username,
//         'Name': getIt<UserLocalDataSource>().getUserData()!.name,
//         'userId': getIt<UserLocalDataSource>().getUserData()!.userId,
//         'subjectName': subjectName,
//       },
//     );
//   }
// }
