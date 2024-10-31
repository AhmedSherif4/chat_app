import 'dart:async';

import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';

class BackgroundDownloader {
  BackgroundDownloader._internal();

  static final BackgroundDownloader _instance =
      BackgroundDownloader._internal();

  factory BackgroundDownloader() => _instance;

  late DownloadTask _task;
  double counter = 0;
  bool isDownloading = false;

  FileDownloader fileDownloader = FileDownloader();

  final _controller = StreamController<double>.broadcast();
  Stream<double> get streamController => _controller.stream.asBroadcastStream();

  void init() async {
    await fileDownloader.configure(
      globalConfig: [
        (Config.requestTimeout, const Duration(seconds: 100)),
      ],
      androidConfig: [
        (Config.useCacheDir, Config.whenAble),
      ],
      iOSConfig: [
        (Config.localize, {'Cancel': 'StopIt'}),
      ],
    );

    void myNotificationTapCallback(
        Task task, NotificationType notificationType) {
      debugPrint(
          'Tapped notification $notificationType for taskId ${task.taskId}');
    }

    // Registering a callback and configure notifications
    fileDownloader
        .registerCallbacks(
            taskNotificationTapCallback: myNotificationTapCallback)
        .configureNotificationForGroup(FileDownloader.defaultGroup,
            running: const TaskNotification('Download {filename}',
                'File: {filename} - {progress} - speed {networkSpeed} and {timeRemaining} remaining'),
            complete: const TaskNotification(
                '{displayName} download {filename}', 'Download complete'),
            error: const TaskNotification(
                'Download {filename}', 'Download failed'),
            paused: const TaskNotification(
                'Download {filename}', 'Paused with metadata {metadata}'),
            progressBar: true)
        .configureNotification(
            complete: const TaskNotification(
                'Download {filename}', 'Download complete'),
            tapOpensFile: true);
  }

  Future<void> downloadFile(
      {required String url, required String fileName}) async {
    init();
    try {
      _task = DownloadTask(
        url: url,
        filename: '$fileName.pdf',
        // directory: 'my_sub_directory',
        updates: Updates.statusAndProgress,
        allowPause: true,
      );

      await fileDownloader.download(
        _task,
        onProgress: (value) {
          if (!value.isNegative) {
            _controller.add(value);
          }
        },
        onStatus: (status) {
          if (status == TaskStatus.complete) {
            isDownloading = false;
          } else if (status == TaskStatus.running) {
            isDownloading = true;
          }
        },
      );
      await fileDownloader.moveToSharedStorage(_task, SharedStorage.downloads);
    } catch (e) {
      // print(e.toString());
    }
  }

  void pauseDownload() async {
    await fileDownloader.pause(_task);
  }

  void cancelDownload() async {
    await fileDownloader.cancelTaskWithId(_task.taskId);
    counter = 0;
  }
}
