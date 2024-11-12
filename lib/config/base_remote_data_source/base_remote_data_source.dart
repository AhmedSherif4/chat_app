import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_consumer.dart';
import '../../core/api/network_info.dart';
import '../../core/exceptions/exceptions.dart';
import '../resources/app_strings.dart';

abstract class BaseRemoteDataSource {
  Future<Map<String, dynamic>> postDataForPayment({
    required String url,
    required Map<String, dynamic> queryParameters,
    Options? options,
  });

  Future<Map<String, dynamic>> postData({
    required String url,
    required Object body,
  });

  Future<Map<String, dynamic>> publicPostData({
    required String url,
    required Object body,
  });

  Future<String> download(
    String url, {
    required dynamic savePath,
    ProgressCallback? onReceiveProgress,
  });

  Future<Map<String, dynamic>> get({
    required String url,
    Options? options,
  });
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl implements BaseRemoteDataSource {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;

  BaseRemoteDataSourceImpl({
    required this.apiConsumer,
    required this.networkInfo,
  });

  @override
  Future<Map<String, dynamic>> postData({
    required String url,
    required Object body,
  }) async {
    await NoInternetConnectionException().checkNetworkConnection();

    final response = await _checkStatusCode(await apiConsumer.post(
      url,
      body: body,
    ));
    //response.log();
    return response;
  }

  @override
  Future<Map<String, dynamic>> publicPostData({
    required String url,
    required Object body,
  }) async {
    await NoInternetConnectionException().checkNetworkConnection();

    final response = await _checkStatusCode(await apiConsumer.publicPost(
      url,
      body: body,
    ));
    //response.log();
    return response;
  }

  @override
  Future<String> download(
    String url, {
    required dynamic savePath,
    ProgressCallback? onReceiveProgress,
  }) async {
    await NoInternetConnectionException().checkNetworkConnection();

    final response = await apiConsumer.download(
      url,
      savePath: savePath,
      onReceiveProgress: onReceiveProgress,
    );
    if (response.statusCode != 200) {
      throw const ServerException(
          message: AppStrings.somethingWrongWhileDownloading);
    }
    return AppStrings.downloadedSuccessfully;
  }

  @override
  Future<Map<String, dynamic>> get({
    required String url,
    Options? options,
  }) async {
    await NoInternetConnectionException().checkNetworkConnection();

    return await _checkStringStatusCode(
        await apiConsumer.get(url, options: options));
  }

  Future<Map<String, dynamic>> _checkStatusCode(Response response) async {
    //response.log();
    if (response.statusCode != 200) {
      throw ServerException(
        message: jsonDecode(response.data)['message'] ??
            AppStrings.someThingWentWrong,
      );
    }
    final json = jsonDecode(response.data);
    if (!json['status']) {
      throw ServerException(
        message: json['message'] ?? AppStrings.someThingWentWrong,
      );
    }
    return json;
  }

  Future<Map<String, dynamic>> _checkStringStatusCode(Response response) async {
    if (response.statusCode != 200) {
      throw ServerException(
        message: jsonDecode(response.data)['message'] ??
            AppStrings.someThingWentWrong,
      );
    }
    final json = jsonDecode(response.data);

    if (json['status'] != 'OK') {
      throw ServerException(
        message: json['message'] ?? AppStrings.someThingWentWrong,
      );
    }
    return json;
  }

  @override
  Future<Map<String, dynamic>> postDataForPayment({
    required String url,
    required Map<String, dynamic> queryParameters,
    Options? options,
  }) async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    }
    final response = await _checkPaymentStatusCode(await apiConsumer.post(
      url,
      queryParameters: queryParameters,
      options: options,
    ));
    return response;
  }

  Future<Map<String, dynamic>> _checkPaymentStatusCode(
      Response response) async {
    if (response.statusCode != 200) {
      throw ServerException(
        message: jsonDecode(response.data)['result']['description'] ??
            AppStrings.someThingWentWrong,
      );
    }
    final json = jsonDecode(response.data);
    if (json['id'] == null) {
      throw ServerException(
        message: json['result']['description'] ?? AppStrings.someThingWentWrong,
      );
    }
    return json;
  }
}
