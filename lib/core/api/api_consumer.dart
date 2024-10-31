import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object body,
    Options? options,
  });


  Future<dynamic> publicPost(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object body,
    Options? options,
  });

  Future<dynamic> download(
    String url, {
    required dynamic savePath,
    ProgressCallback? onReceiveProgress,
  });

  Future<dynamic> get(
    String path, {
    Options? options,
  });
}
