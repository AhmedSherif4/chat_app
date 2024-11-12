import 'package:chat/features/home/home.dart';
import 'package:chat/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../features/login/logic/login_cubit/login_cubit.dart';
import '../../features/login/ui/login_screens/fill_user_data.dart';
import '../../features/login/ui/login_screens/verification_screen.dart';
import '../../my_app/splash/splash_screen.dart';
import 'routes_names.dart';
import 'un_defined_route.dart';

class AppRouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.rSplashScreen:
        return animatePageRouteBuilder(
/*          BlocProvider(
            create: (context) =>
                getIt<SplashBloc>()..add(IsAlreadyAuthenticatedEvent()),
            child:*/
          const SplashScreen(),
          /*),*/
        );
      case AppRoutesNames.rHomeScreen:
        return animatePageRouteBuilder(
          HomeScreen(),
        );
      case AppRoutesNames.rLoginScreen:
        return animatePageRouteBuilder(
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case AppRoutesNames.rVerificationScreen:
        return animatePageRouteBuilder(
          BlocProvider.value(
            value: getIt<LoginCubit>(),
            child: const VerificationScreen(),
          ),
        );
      case AppRoutesNames.rFillUserData:
        return animatePageRouteBuilder(
          BlocProvider.value(
            value: getIt<LoginCubit>(),
            child: const FillUserData(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static PageRouteBuilder<dynamic> animatePageRouteBuilder(Widget page) {
    return PageRouteBuilder(
      transitionsBuilder: (_, animation, __, child) {
        animation = CurvedAnimation(
          parent: animation,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.fastOutSlowIn,
        );
        return Align(
          //! chande Alignment and axis to whatever you want
          alignment: Alignment.centerRight,
          child: SizeTransition(
            axis: Axis.horizontal,
            sizeFactor: animation,
            axisAlignment: 0,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (_, __, ___) => page,
    );
  }
}
