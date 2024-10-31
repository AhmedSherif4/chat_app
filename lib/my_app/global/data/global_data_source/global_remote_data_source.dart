// import 'package:injectable/injectable.dart';
// import 'package:chat/config/base_remote_data_source/base_remote_data_source.dart';
// import 'package:chat/core/api/api_consumer.dart';
// import 'package:chat/core/api/end_points.dart';
// import 'package:chat/core/api/network_info.dart';
// import '../../../../../core/shared_models/auth_entity/auth_entity.dart';
// import '../model/app_version_model.dart';
//
// abstract class GlobalBaseRemoteDataSource {
//
//   Future<bool> sendTime(int min);
//
//   // Future<AuthEntity> getGuestData();
//
//   Future<AppVersionModel> checkAppVersion();
//
//   Future<InfoModel> info();
//
//
// }
//
// @LazySingleton(as: GlobalBaseRemoteDataSource)
// class GlobalRemoteDataSourceImpl
//     implements GlobalBaseRemoteDataSource {
//   final ApiConsumer apiConsumer;
//   final NetworkInfo networkInfo;
//   final BaseRemoteDataSource baseRemoteDataSource;
//
//   const GlobalRemoteDataSourceImpl({
//     required this.networkInfo,
//     required this.apiConsumer,
//     required this.baseRemoteDataSource,
//   });
//
//   @override
//   Future<bool> sendTime(int min) async {
//     final response = await baseRemoteDataSource
//         .postData(url: EndPoints.sendTimeInApp, body: {'minutes': min});
//     return response['status'];
//   }
//
//   // @override
//   // Future<AuthEntity> getGuestData() async {
//   //   final response = await baseRemoteDataSource
//   //       .postData(url: EndPoints.getGuestData, body: {});
//   //
//   //   return LoginModel.fromMap(response);
//   // }
//
//   @override
//   Future<AppVersionModel> checkAppVersion() async {
//     final response = await baseRemoteDataSource
//         .postData(url: EndPoints.checkVersion, body: {});
//     return AppVersionModel.fromJson(response['data']);
//   }
//
//   @override
//   Future<InfoModel> info() async {
//     final response = await baseRemoteDataSource.publicPostData(
//       url: EndPoints.contactUsPath,
//       body: {},
//     );
//
//     return InfoModel.fromJson(response['data']);
//   }
// }
