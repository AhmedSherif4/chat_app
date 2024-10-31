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
// abstract class CheckUserTokenBaseRemoteDataSource {
//   Future<bool> checkUserToken();
//   Future<UserEntity> editUserData();
//
// }
//
// @LazySingleton(as: CheckUserTokenBaseRemoteDataSource)
// class CheckUserTokenRemoteDataSourceImpl
//     implements CheckUserTokenBaseRemoteDataSource {
//   final ApiConsumer apiConsumer;
//   final NetworkInfo networkInfo;
//   final BaseRemoteDataSource baseRemoteDataSource;
//
//   const CheckUserTokenRemoteDataSourceImpl({
//     required this.networkInfo,
//     required this.apiConsumer,
//     required this.baseRemoteDataSource,
//   });
//
//   @override
//   Future<bool> checkUserToken() async {
//     if (!await networkInfo.isConnected) {
//       throw const NoInternetConnectionException();
//     } else {
//       final response = await apiConsumer.post(EndPoints.checkTokenPath);
//
//       if(response == null){
//         return false;
//       }
//       return jsonDecode(response.data)['status'];
//     }
//   }
//
//   @override
//   Future<UserEntity> editUserData() async {
//
//       final response = await baseRemoteDataSource.postData(url:EndPoints.mePath,body: {},);
//       return UserModel.fromMap(response['data']);
//
//   }
//
//
// }
