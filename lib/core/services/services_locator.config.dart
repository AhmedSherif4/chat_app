// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat/config/base_local_data_source/app_preferences.dart'
as _i70;
import 'package:chat/config/base_local_data_source/base_local_data_source.dart'
as _i476;
import 'package:chat/config/base_remote_data_source/base_remote_data_source.dart'
as _i836;
import 'package:chat/config/base_repository/base_repository.dart' as _i222;
import 'package:chat/config/storages/secure_storage.dart' as _i357;
import 'package:chat/core/api/api_consumer.dart' as _i64;
import 'package:chat/core/api/dio_consumer.dart' as _i182;
import 'package:chat/core/api/interceptors.dart' as _i145;
import 'package:chat/core/api/network_info.dart' as _i885;
import 'package:chat/core/services/third_party_instance.dart' as _i317;
import 'package:chat/core/shared_models/user/data/user_local_data_source/user_local_data_source.dart'
as _i874;
import 'package:chat/core/shared_widgets/image_pick/image_pick_view_model/image_pick_bloc.dart'
as _i86;

import 'package:chat/features/login/logic/login_cubit/login_cubit.dart'
as _i166;
import 'package:chat/features/login/login.dart' as _i650;
import 'package:chat/my_app/app_settings/app_settings_cubit.dart' as _i219;
import 'package:chat/my_app/splash/data/splash_data_source/splash_remote_data_source.dart'
as _i59;
import 'package:chat/my_app/splash/data/splash_screen_repository/splash_repository.dart'
as _i618;
import 'package:chat/my_app/splash/splash_screen.dart' as _i855;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
          () => injectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i86.ImagePickBloc>(() => _i86.ImagePickBloc());
    gh.lazySingleton<_i145.AppInterceptors>(() => _i145.AppInterceptors());
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
            () => injectableModule.internetConnectionChecker);
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
            () => injectableModule.firebaseFirestore);
    gh.lazySingleton<_i885.NetworkInfo>(
            () => _i885.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i476.BaseLocalDataSource>(
            () => _i476.BaseLocalDataSourceImpl());
    gh.lazySingleton<_i222.BaseRepository>(() => _i222.BaseRepositoryImpl());
    gh.lazySingleton<_i59.SplashBaseRemoteDataSource>(
            () => _i59.SplashRemoteDataSourceImpl());
    gh.lazySingleton<_i70.AppPreferences>(
            () => _i70.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i618.SplashBaseRepository>(() =>
        _i618.SplashRepository(
          remoteDataSource: gh<_i59.SplashBaseRemoteDataSource>(),
          baseRepository: gh<_i222.BaseRepository>(),
        ));
    gh.lazySingleton<_i64.ApiConsumer>(
            () => _i182.DioConsumer(client: gh<_i361.Dio>()));
    gh.lazySingleton<_i836.BaseRemoteDataSource>(
            () =>
            _i836.BaseRemoteDataSourceImpl(
              apiConsumer: gh<_i64.ApiConsumer>(),
              networkInfo: gh<_i885.NetworkInfo>(),
            ));
    gh.lazySingleton<_i650.LoginRemoteDataSource>(
            () =>
            _i650.LoginRemoteDataSourceImpl(
              firebaseAuth: gh<_i59.FirebaseAuth>(),
              firestore: gh<_i974.FirebaseFirestore>(),
            ));
    gh.factory<_i219.AppSettingsCubit>(
            () => _i219.AppSettingsCubit(gh<_i70.AppPreferences>()));
    gh.lazySingleton<_i874.UserLocalDataSource>(() =>
        _i874.UserLocalDataSourceImpl(
            baseLocalDataSource: gh<_i476.BaseLocalDataSource>()));
    gh.lazySingleton<_i357.BaseAppSecurityData>(() =>
        _i357.AppSecurityData(
            localDataSource: gh<_i476.BaseLocalDataSource>()));
    gh.lazySingleton<_i650.LoginBaseRepository>(() =>
        _i650.LoginRepository(
          remoteDataSource: gh<_i650.LoginRemoteDataSource>(),
          baseRepository: gh<_i222.BaseRepository>(),
          userLocalDataSource: gh<_i874.UserLocalDataSource>(),
        ));
    gh.factory<_i855.SplashBloc>(
            () => _i855.SplashBloc(gh<_i618.SplashBaseRepository>()));
    gh.factory<_i166.LoginCubit>(() =>
        _i166.LoginCubit(
          gh<_i650.LoginBaseRepository>(),
          gh<_i70.AppPreferences>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i317.InjectableModule {}
