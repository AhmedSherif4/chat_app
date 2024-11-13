import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:chat/features/camera/CameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/bloc/bloc_observer.dart';
import 'core/services/services_locator.dart';
import 'my_app/app_requirement_setup.dart';
import 'my_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  cameras = await availableCameras();
  AppRequirementSetup.initialFutures();
  AppRequirementSetup.registerHiveAdapter();
  runApp(
    MyApp(),
  );
}

/// todo:
/// secure the app,
/// analys with firebase,
/// google map integration,
/// adaptive
/// clean architecture

Future<dynamic> computeIsolate(Future Function() function) async {
  final receivePort = ReceivePort();
  var rootToken = RootIsolateToken.instance!;
  await Isolate.spawn<_IsolateData>(
    _isolateEntry,
    _IsolateData(
      token: rootToken,
      function: function,
      answerPort: receivePort.sendPort,
    ),
  );
  return await receivePort.first;
}

void _isolateEntry(_IsolateData isolateData) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(isolateData.token);
  final answer = await isolateData.function();
  isolateData.answerPort.send(answer);
}

class _IsolateData {
  final RootIsolateToken token;
  final Function function;
  final SendPort answerPort;

  _IsolateData({
    required this.token,
    required this.function,
    required this.answerPort,
  });
}
