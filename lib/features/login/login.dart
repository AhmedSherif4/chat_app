import 'dart:async';

import 'package:chat/config/base_local_data_source/app_preferences.dart';
import 'package:chat/config/resources/app_colors.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/config/routes/route_manager.dart';
import 'package:chat/config/routes/routes_names.dart';
import 'package:chat/core/base_widgets/loading_widget.dart';
import 'package:chat/core/base_widgets/snackbar_widget.dart';
import 'package:chat/core/enum/enum_generation.dart';
import 'package:chat/core/shared_models/user/user_entity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_repository/base_repository.dart';
import '../../app_assets/app_assets.dart';
import '../../core/exceptions/exceptions.dart';
import '../../core/failure/failure.dart';
import '../../core/services/services_locator.dart';
import '../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../core/shared_models/user/user_model/user_model.dart';
import '../../my_app/app_reference.dart';
import 'logic/login_cubit/login_cubit.dart';

part 'data/login_data_source/login_remote_data_source.dart';
part 'data/login_models/login_entity.dart';
part 'data/login_models/login_model.dart';
part 'data/login_repository/login_repository.dart';
part 'ui/login_screens/login_screen.dart';
part 'ui/login_widgets/login_widgets.dart';
