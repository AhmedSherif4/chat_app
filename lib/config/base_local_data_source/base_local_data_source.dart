import 'package:chat/config/storages/keys.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../resources/app_constants.dart';

abstract class BaseLocalDataSource {
  Future<void> saveListOfDataInLocal<T>({
    required String labelKey,
    required List<T> data,
    Duration expirationDuration =
        const Duration(hours: AppConstants.appLocalDurationInHours),
  });

  Future<List<T>?> getListOfDataFromLocal<T>({
    required String labelKey,
  });

  Future<void> saveDataInLocal<T>({
    required String labelKey,
    required T data,
    Duration expirationDuration =
        const Duration(hours: AppConstants.appLocalDurationInHours),
  });

  Future<T?> getDataFromLocal<T>({
    required String labelKey,
  });

  Future<void> updateListDataInLocal<T>({
    required int index,
    required String labelKey,
    required T updatedData,
    Duration expirationDuration =
        const Duration(hours: AppConstants.appLocalDurationInHours),
  });

  Future<void> deleteDataAt<T>(String labelKey);

  Future<void> deleteItemInKey<T>({
    required String labelKey,
    required int index,
  });
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  late Box dataBox;
  late Box<String> dataExpirationBox;

  @override
  Future<void> saveListOfDataInLocal<T>({
    required String labelKey,
    required List<T> data,
    Duration expirationDuration = const Duration(hours: 2),
  }) async {
    try {
      dataExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(labelKey));
      await dataExpirationBox.put(
        AppKeys.getExpirationKey(labelKey),
        DateTime.now().add(expirationDuration).toIso8601String(),
      );
      dataBox = Hive.box<T>(
        labelKey,
      );

      await dataBox.addAll(data);
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<List<T>?> getListOfDataFromLocal<T>({
    required String labelKey,
  }) async {
    try {
      dataExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(labelKey));
      final String? subjectsExpirationTime =
          dataExpirationBox.get(AppKeys.getExpirationKey(labelKey));

      dataBox = Hive.box<T>(labelKey);

      final dataList = Hive.box<T>(labelKey);

      if (dataList.isEmpty || subjectsExpirationTime == null) {
        return null;
      }
      DateTime expirationTime = DateTime.parse(subjectsExpirationTime);

      if (expirationTime.isBefore(DateTime.now())) {
        dataBox.delete(labelKey);
        dataList.isEmpty ? null : dataList.clear();
        return null;
      } else {
        return dataList.values.toList();
      }
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<T?> getDataFromLocal<T>({
    required String labelKey,
  }) async {
    try {
      dataExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(labelKey));
      final String? subjectsExpirationTime =
          dataExpirationBox.get(AppKeys.getExpirationKey(labelKey));

      dataBox = Hive.box<T>(
        labelKey,
      );

      final data = dataBox.get(labelKey);

      if (data == null || subjectsExpirationTime == null) {
        return null;
      }
      DateTime expirationTime = DateTime.parse(subjectsExpirationTime);

      if (expirationTime.isBefore(DateTime.now())) {
        dataBox.delete(labelKey);
        return null;
      } else {
        return data;
      }
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> saveDataInLocal<T>({
    required String labelKey,
    required T data,
    Duration expirationDuration =
        const Duration(hours: AppConstants.appLocalDurationInHours),
  }) async {
    try {
      dataExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(labelKey));

      await dataExpirationBox.put(
        AppKeys.getExpirationKey(labelKey),
        DateTime.now().add(expirationDuration).toIso8601String(),
      );

      dataBox = Hive.box<T>(
        labelKey,
      );

      await dataBox.put(labelKey, data);
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> updateListDataInLocal<T>({
    required int index,
    required String labelKey,
    required T updatedData,
    Duration expirationDuration =
        const Duration(hours: AppConstants.appLocalDurationInHours),
  }) async {
    try {
      dataExpirationBox = Hive.box<String>(AppKeys.getExpirationKey(labelKey));

      await dataExpirationBox.putAt(
        index,
        DateTime.now().add(expirationDuration).toIso8601String(),
      );

      dataBox = Hive.box<T>(
        labelKey,
      );

      await dataBox.putAt(index, updatedData);
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> deleteDataAt<T>(String labelKey) async {
    final expirationBox = Hive.box<String>(AppKeys.getExpirationKey(labelKey));
    final dataBox = Hive.box<T>(labelKey);
    await expirationBox.clear();
    await dataBox.clear();
  }

  @override
  Future<void> deleteItemInKey<T>({
    required String labelKey,
    required int index,
  }) async {
    final dataBox = Hive.box<T>(labelKey);
    final dataList = Hive.box<T>(labelKey);
    final myList = dataList.values.toList();
    if (index >= 0 && index < myList.length) {
      myList.removeAt(index);
    }
    await dataBox.clear();
    await dataBox.addAll(myList);
  }
}
