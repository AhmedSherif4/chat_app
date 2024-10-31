import 'dart:convert';

import 'package:chat/config/storages/keys.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import '../base_local_data_source/base_local_data_source.dart';

abstract class BaseAppSecurityData {
  Future<void> saveToken({required String token});

  Future<void> deleteToken();

  String? getToken();
}

@LazySingleton(as: BaseAppSecurityData)
class AppSecurityData implements BaseAppSecurityData {
  final BaseLocalDataSource localDataSource;

  AppSecurityData({required this.localDataSource});

  @override
  String? getToken() {
    // try {
    // final tokenExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(AppKeys.accessToken));

    // final String? tokenExpirationDate = tokenExpirationBox.get(AppKeys.getExpirationKey(AppKeys.accessToken));

    final tokenBox = Hive.box<String>(AppKeys.accessToken);

    final token = tokenBox.get(AppKeys.accessToken);
    // if (token == null || tokenExpirationDate == null) {
    //   return null;
    // }
    // DateTime expirationTime = DateTime.parse(tokenExpirationDate);
    // if (expirationTime.isBefore(DateTime.now())) {
    //   tokenBox.delete(AppKeys.accessToken);
    //   return null;
    // } else {
    return token == null ? 'not' : utf8.decode(base64Decode(token));
    // }
    // } on HiveError {
    //   rethrow;
    // }
  }

  @override
  Future<void> saveToken({required String token}) async {
    try {
      // if (getToken() != null) deleteToken();
      // final dataExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(AppKeys.accessToken));
      //
      // await dataExpirationBox.put(AppKeys.getExpirationKey(AppKeys.accessToken),
      //   DateTime.now().add(const Duration(days: AppConstants.tokenLocalDurationInDays))
      //       .toIso8601String(),
      // );

      final tokenBox = Hive.box<String>(AppKeys.accessToken);

      await tokenBox.put(AppKeys.accessToken, base64Encode(utf8.encode(token)));
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      // final dataExpirationBox =
      //     Hive.box<String>(AppKeys.getExpirationKey(AppKeys.accessToken));
      // await dataExpirationBox.delete(
      //   AppKeys.getExpirationKey(AppKeys.accessToken),
      // );
      final tokenBox = Hive.box<String>(AppKeys.accessToken);
      await tokenBox.delete(AppKeys.accessToken);
    } on HiveError {
      rethrow;
    }
  }
}
