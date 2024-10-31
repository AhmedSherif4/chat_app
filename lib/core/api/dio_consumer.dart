import 'dart:async';

import 'package:chat/config/routes/routes_names.dart';
import 'package:chat/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../config/storages/secure_storage.dart';
import '../../my_app/app_reference.dart';
import '../../my_app/my_app.dart';
import '../services/services_locator.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'interceptors.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({
    required this.client,
  }) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..connectTimeout = const Duration(minutes: 1)
      ..headers = {
        contentType: applicationJson,
        accept: applicationJson,
      }
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < 500;
      };
    client.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      client.interceptors.add(LogInterceptor());
    }
  }

  String applicationJson = 'application/json';
  String contentType = 'content-type';
  String accept = 'accept';
  String authorization = 'authorization';
  String defaultLanguage = 'language';

  @override
  Future post(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: options ??
            Options(headers: {
              'Authorization':
                  'Bearer ${(getIt<BaseAppSecurityData>().getToken() != null) ? getIt<BaseAppSecurityData>().getToken()! : ''}',
            }),
      );
      if (response.statusCode == 401) {
        if (getIt<BaseAppSecurityData>().getToken() != null) {
          getIt<BaseAppSecurityData>().deleteToken();
        }
        // if( navigatorKey.currentWidget != AppRoutesNames.rSplashScreen)
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutesNames.rLoginScreen, (route) => false);
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future publicPost(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: options ??
            Options(headers: {
              //'Authorization': 'Bearer '' }',
            }),
      );
      if (response.statusCode == 401) {
        if (getIt<BaseAppSecurityData>().getToken() != null) {
          getIt<BaseAppSecurityData>().deleteToken();
        }
        // if( navigatorKey.currentWidget != AppRoutesNames.rSplashScreen)
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutesNames.rLoginScreen, (route) => false);
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future download(
    String url, {
    required dynamic savePath,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await client.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future get(
    String path, {
    Options? options,
  }) async {
    try {
      final response = await client.get(
        path,
        options: options,
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  DioExceptionType? _handleError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        throw const ServerException(
            message: 'انتهاء الوقت أثناء الاتصال بخادم ');
      case DioExceptionType.sendTimeout:
        throw const ServerException(
            message: 'انتهاء الوقت أثناء إرسال الطلب إلى خادم ');
      case DioExceptionType.receiveTimeout:
        throw const ServerException(
            message: 'انتهاء الوقت أثناء استقبال البيانات من خادم ');
      case DioExceptionType.badCertificate:
        throw const ServerException(message: 'شهادة غير صالحة من خادم ');
      case DioExceptionType.badResponse:
        if (dioError.response!.statusCode == 404) {
          throw const ServerException(
              message:
                  'لم يتم العثور على الطلب الخاص بك، يرجى المحاولة مرة أخرى لاحقًا');
        } else if (dioError.response!.statusCode == 500) {
          throw const ServerException(
              message: 'هناك مشكلة في الخادم، يرجى المحاولة مرة أخرى لاحقًا');
        } else if (dioError.response!.statusCode == 400 ||
            dioError.response!.statusCode == 401 ||
            dioError.response!.statusCode == 403) {
          // if(dioError.message == 'Unauthorized' &&  AppReference.getCurrentRoute() != AppRoutesNames.rSplashScreen) {
          AppReference.navigatorKey.currentState!.pushNamedAndRemoveUntil(
              AppRoutesNames.rLoginScreen, (route) => false);
          // }else {
          //   throw const ServerException(message: 'حدث خطأ');
          // }
          // } else {
          throw const ServerException(
              message: 'حدث خطأ، يرجى المحاولة مرة أخرى');
        }
      case DioExceptionType.cancel:
        throw const ServerException(message: 'تم إلغاء الطلب');
      case DioExceptionType.connectionError:
        throw const ServerException(message: 'لا يوجد اتصال بالإنترنت');
      case DioExceptionType.unknown:
        throw const ServerException(
            message: 'عذرًا! حدث خطأ، يرجى المحاولة مرة أخرى');
    }
    return null;
  }
}
