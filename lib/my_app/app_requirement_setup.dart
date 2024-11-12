import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';

import '../config/firebase/firebase_options.dart';
import '../config/storages/keys.dart';
import '../core/shared_models/user/user_entity/user_entity.dart';

class AppRequirementSetup {
  AppRequirementSetup._();

  static final AppRequirementSetup _instance = AppRequirementSetup._();

  static AppRequirementSetup get instance => _instance;

  static Future<void> initialFutures() async {
    await Hive.initFlutter();
    await Future.wait([
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.userData)),
      Hive.openBox<UserEntity>(AppKeys.userData),
    ]);
  }

  static void registerHiveAdapter() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserEntityAdapter());
    }
  }
}
