// import 'dart:convert';
//
// import 'package:injectable/injectable.dart';
// import 'package:chat/config/base_remote_data_source/base_remote_data_source.dart';
// import 'package:chat/core/api/api_consumer.dart';
// import 'package:chat/core/api/end_points.dart';
// import 'package:chat/core/api/network_info.dart';
// import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
// import '../../../../../core/exceptions/exceptions.dart';
// import '../../../../../core/shared_models/user/user_model/user_model.dart';
//
import 'package:chat/core/exceptions/exceptions.dart';
import 'package:chat/core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/services_locator.dart';

abstract class SplashBaseRemoteDataSource {
  Future<bool> isAlreadyAuthenticated();
}

//
@LazySingleton(as: SplashBaseRemoteDataSource)
class SplashRemoteDataSourceImpl implements SplashBaseRemoteDataSource {
  @override
  Future<bool> isAlreadyAuthenticated() async {
    try {
      return (getIt<UserLocalDataSource>().getUserData()?.userId?.isNotEmpty ??
          false || getIt<UserLocalDataSource>().getUserData()?.userId == '');
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
