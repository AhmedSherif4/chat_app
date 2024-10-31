// import 'dart:io';
//
// import 'package:chat/core/api/api_consumer.dart';
// import 'package:chat/my_app/app_reference.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// import 'package:injectable/injectable.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// @LazySingleton()
// class NotificationSetup {
//   NotificationSetup({
//     required this.apiConsumer,
//   });
//
//   final ApiConsumer apiConsumer;
//
//   // Notification Permission from Permission Handler
//   static const notiPermission = Permission.notification;
//   // Notification Object
//   static final messagingPermission = FirebaseMessaging.instance;
//
//   //get User Token
//   static Future<String> getNotificationTokenFromFireBase() async {
//     try {
//       if (await AppReference.isHuaweiDevice()) {
//         return 'not found this Huawei Device';
//       } else {
//         return await FirebaseMessaging.instance.getToken() ?? '';
//       }
//     } catch (e) {
//       return 'not found this Huawei Device  $e';
//     }
//   }
//
//   // Request Notification Permission
//   static Future<PermissionStatus> notiPermissionRequest() async {
//     return await notiPermission.request();
//   }
//
//   // Check Notification Permission
//   static Future<bool> notiPermissionStatus() async {
//     if (await notiPermission.isGranted) {
//       FirebaseMessaging.instance.getToken();
//       //.then((token) => token?.log());
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   static Future<String> _downloadAndSaveFile(
//       String? url, String fileName) async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/$fileName';
//       final response = await http.get(Uri.parse(url!));
//       final file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);
//       return filePath;
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static const AndroidNotificationChannel _androidChannel =
//       AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     importance: Importance.max,
//     showBadge: true,
//     playSound: true,
//
//     // sound: RawResourceAndroidNotificationSound('ring'),
//   );
//
//   // Object for Local Notification
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static Future<void> createAndroidLocalNotificationChannel() async {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(_androidChannel);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         final largeIconPath = await _downloadAndSaveFile(
//             notification.android!.imageUrl, 'largeIcon');
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               _androidChannel.id,
//               _androidChannel.name,
//               channelDescription: _androidChannel.description ?? '',
//               icon: '@mipmap/ic_launcher',
//               playSound: true,
//               sound: _androidChannel.sound,
//               importance: _androidChannel.importance,
//               priority: Priority.max,
//               largeIcon: largeIconPath.isNotEmpty
//                   ? FilePathAndroidBitmap(largeIconPath)
//                   : null,
//             ),
//           ),
//         );
//       }
//     });
//   }
//
//   static Future<void> setupInteractedMessage() async {
//     RemoteMessage? initialMessage =
//         await messagingPermission.getInitialMessage();
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }
//
//   static void _handleMessage(RemoteMessage message) {
//     // if (message.data['type'] == 'notification') {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rNotificationScreen,
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'coupon') {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rCouponsScreen,
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'newExam') {
//     //   if (AppReference.childIsPrimary()) {
//     //     navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //       AppRoutesNames.rPrimaryChildChallengeScreen,
//     //       (route) => false,
//     //     );
//     //   } else {
//     //     navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //       AppRoutesNames.rChildChallengeScreen,
//     //       (route) => false,
//     //     );
//     //   }
//     // } else if (message.data['type'] == 'childSolveQuestion' &&
//     //     AppReference.userIsParent()) {
//     //   // data must be like this data : { 'type' : 'childSolveQuestion', 'childId': '123' }
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rParentChildDetails,
//     //     arguments: message.data['childId'],
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'nafeese' &&
//     //     AppReference.userIsChild()) {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rNafeesPlanScreen,
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'cart') {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rCartScreen,
//     //     arguments: message.data['childId'] ?? 0,
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'parentAcceptInvention' &&
//     //     AppReference.userIsChild()) {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rParentPreviewForChildScreen,
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'RateRepliedFromAdmin') {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rReviewScreen,
//     //     (route) => false,
//     //   );
//     // } else if (message.data['type'] == 'inviteFriends' &&
//     //     AppReference.userIsChild()) {
//     //   navigatorKey.currentState!.pushNamedAndRemoveUntil(
//     //     AppRoutesNames.rInviteFriendScreen,
//     //     (route) => false,
//     //   );
//     // }
//   }
//
//   // Handle IOS Background Notification
//   static Future<void> iosBackGroundNotification() async {
//     messagingPermission.setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//   }
//
//   final DarwinNotificationDetails darwinNotificationDetails =
//       const DarwinNotificationDetails(
//           presentAlert: true, presentBadge: true, presentSound: true);
// }
