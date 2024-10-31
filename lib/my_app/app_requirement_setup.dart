import 'package:hive_flutter/adapters.dart';

import '../core/shared_models/user/user_entity/user_entity.dart';

class AppRequirementSetup {
  AppRequirementSetup._();

  static final AppRequirementSetup _instance = AppRequirementSetup._();

  static AppRequirementSetup get instance => _instance;

  static Future<void> initialFutures() async {
    await Future.wait([
      //! analytics
      // AppAnalytics.initAppsFlyer(),

      // if(!await AppReference.isHuaweiDevice())...[
      //! firebase
      //   Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      //   ],

      //! Token
      // Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.accessToken)),
      // Hive.openBox<String>(AppKeys.accessToken),

      //! UserData
      // Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.userData)),
      // Hive.openBox<UserEntity>(AppKeys.userData),

      //! showcase
      // Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.showcaseViewed)),
      // Hive.openBox<bool>(AppKeys.showcaseViewed),

      //! contactUs
      // Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.contactUs)),
      // Hive.openBox<ContactUsEntity>(AppKeys.contactUs),
    ]);
  }

  static void registerHiveAdapter() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserEntityAdapter());
    }
    //! contactUs
    //  if (!Hive.isAdapterRegistered(2)) {
    //    Hive.registerAdapter(ContactUsEntityAdapter());
    //  }
  }
}
