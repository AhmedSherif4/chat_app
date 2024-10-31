library splash_screen;

import 'dart:async';

import 'package:chat/config/notification/notification_setup.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/config/routes/routes_names.dart';
import 'package:chat/config/storages/secure_storage.dart';
import 'package:chat/core/api/network_info.dart';
import 'package:chat/core/base_widgets/snackbar_widget.dart';
import 'package:chat/core/enum/enum_generation.dart';
import 'package:chat/core/services/services_locator.dart';
import 'package:chat/my_app/app_reference.dart';
import 'package:chat/my_app/splash/presentation/components/exit_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/internet_connection/internet_connection_setup.dart';
import '../../../../../config/resources/app_assets.dart';
import '../../../../../config/resources/app_colors.dart';
import '../../../../../config/resources/app_constants.dart';
import '../../../../../config/resources/app_strings.dart';
import '../../../../../config/storages/keys.dart';
import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../global/global_view_model/global_bloc.dart';

part 'presentation/components/debugging_dialog.dart';
part 'presentation/components/developer_mode_dialog.dart';
part 'presentation/components/physical_debugging_dialog.dart';
part 'presentation/components/repair_dialog.dart';
part 'presentation/components/update_dialog.dart';
part 'presentation/splash_view_model/splash_bloc.dart';
part 'presentation/splash_view_model/splash_event.dart';
part 'presentation/splash_view_model/splash_state.dart';
part 'presentation/view/splash_functions.dart';
part 'presentation/view/splash_view.dart';
