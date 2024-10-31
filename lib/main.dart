import 'package:camera/camera.dart';
import 'package:chat/features/camera/CameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'config/bloc/bloc_observer.dart';
import 'core/services/services_locator.dart';
import 'my_app/app_requirement_setup.dart';
import 'my_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  cameras = await availableCameras();
  await Hive.initFlutter();
  AppRequirementSetup.registerHiveAdapter();
  configureDependencies();

  runApp(
    MyApp(),
  );
}

/// todo:
/// secure the app,
/// analys with firebase,
/// google map integration,
