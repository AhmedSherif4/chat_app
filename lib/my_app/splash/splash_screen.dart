library splash_screen;

import 'dart:async';

import 'package:chat/config/base_local_data_source/app_preferences.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/config/routes/routes_names.dart';
import 'package:chat/core/services/services_locator.dart';
import 'package:chat/my_app/app_reference.dart';
import 'package:chat/my_app/splash/data/splash_screen_repository/splash_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/internet_connection/internet_connection_setup.dart';
import '../../../../../config/resources/app_colors.dart';
import '../../../../../config/resources/app_constants.dart';
import '../../app_assets/app_assets.dart';
import '../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';

part 'presentation/splash_view_model/splash_bloc.dart';
part 'presentation/splash_view_model/splash_event.dart';
part 'presentation/splash_view_model/splash_state.dart';
part 'presentation/view/splash_functions.dart';
part 'presentation/view/splash_view.dart';
