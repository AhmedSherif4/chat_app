import 'package:chat/config/base_local_data_source/base_local_data_source.dart';
import 'package:chat/config/resources/app_constants.dart';
import 'package:chat/config/storages/keys.dart';
import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class UserLocalDataSource {
  Future<void> saveUserData({required UserEntity userModel});

  UserEntity? getUserData();
}

@LazySingleton(
  as: UserLocalDataSource,
)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final BaseLocalDataSource baseLocalDataSource;

  UserLocalDataSourceImpl({required this.baseLocalDataSource});

  @override
  UserEntity? getUserData() {
    try {
      final dataExpirationBox =
          Hive.box<String>(AppKeys.getExpirationKey(AppKeys.userData));
      final String? subjectsExpirationTime =
          dataExpirationBox.get(AppKeys.getExpirationKey(AppKeys.userData));
      final dataBox = Hive.box<UserEntity>(AppKeys.userData);

      final data = dataBox.get(AppKeys.userData);
      if (data == null || subjectsExpirationTime == null) {
        return null;
      }
      DateTime expirationTime = DateTime.parse(subjectsExpirationTime);
      if (expirationTime.isBefore(DateTime.now())) {
        dataBox.delete(AppKeys.userData);
        return null;
      } else {
        return data;
      }
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> saveUserData({required UserEntity userModel}) async {
    try {
      final dataExpirationBox =
          Hive.box<String>(AppKeys.getExpirationKey(AppKeys.userData));
      dataExpirationBox.put(
        AppKeys.getExpirationKey(AppKeys.userData),
        DateTime.now()
            .add(const Duration(days: AppConstants.appLocalDurationInDays))
            .toIso8601String(),
      );

      final dataBox = Hive.box<UserEntity>(
        AppKeys.userData,
      );

      dataBox.put(AppKeys.userData, userModel);
    } on HiveError {
      rethrow;
    }
  }
}
