import 'dart:ui' as ui;

import 'package:chat/config/resources/app_strings.dart';
import 'package:chat/config/responsive/responsive.dart';
import 'package:chat/core/services/services_locator.dart';
import 'package:chat/core/shared_widgets/image_pick/image_pick_view_model/image_pick_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/adaptive/platform_builder.dart';
import '../config/internet_connection/internet_connection_setup.dart';
import '../config/resources/theme_mode/theme_manager.dart';
import '../config/routes/routes_generator.dart';
import '../config/routes/routes_names.dart';
import 'app_reference.dart';
import 'app_settings/app_settings_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    // DeepLinkManager.instance.initDeepLink();
    super.initState();
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    AppReference.getDeviceInfo(context);
    ResponsiveManager.init(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppSettingsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ImagePickBloc>(),
        ),
      ],
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        textDirection: ui.TextDirection.ltr,
        children: [
          BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              return PlatformBuilder(
                androidBuilder: _materialApp,
                iosBuilder: _cupertinoApp,
                webBuilder: _materialApp,
                windowsBuilder: _materialApp,
              );
            },
          ),
          //! for checking the internet connection
          const ConnectionAlert(),
        ],
      ),
    );
  }

  Widget _materialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeManager.appThemeData[AppTheme.light],
      darkTheme: ThemeManager.appThemeData[AppTheme.dark],
      themeMode: context.read<AppSettingsCubit>().getThemeMode()
          ? ThemeMode.dark
          : ThemeMode.light,
      onGenerateRoute: AppRouteGenerator.onGenerateRoute,
      initialRoute: AppRoutesNames.rSplashScreen,
      navigatorKey: navigatorKey,
    );
  }

  Widget _cupertinoApp(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: AppRouteGenerator.onGenerateRoute,
      initialRoute: AppRoutesNames.rSplashScreen,
      navigatorKey: navigatorKey,
      theme: CupertinoThemeData(
        brightness: context.read<AppSettingsCubit>().getThemeMode()
            ? Brightness.dark
            : Brightness.light,
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
