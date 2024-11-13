import 'dart:io';

import 'package:chat/config/resources/app_colors.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/config/routes/routes_names.dart';
import 'package:chat/core/base_widgets/snackbar_widget.dart';
import 'package:chat/core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import 'package:chat/core/shared_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/route_manager.dart';
import '../../../../core/base_widgets/loading_widget.dart';
import '../../../../core/enum/enum_generation.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/shared_models/user/user_model/user_model.dart';
import '../../../../core/shared_widgets/image_pick/image_pick_view_model/image_pick_bloc.dart';
import '../../../../core/shared_widgets/image_pick/pick_image_inkwell/pick_image_ink_well.dart';
import '../../logic/login_cubit/login_cubit.dart';
import '../../login.dart';

class FillUserData extends StatefulWidget {
  const FillUserData({super.key});

  @override
  _FillUserDataState createState() => _FillUserDataState();
}

class _FillUserDataState extends State<FillUserData>
    with WidgetsBindingObserver {
  File file = File('');
  String errorMessage = "";
  final _nameController = TextEditingController();
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    setState(() {
      isKeyboardVisible = isKeyboardOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state.saveUserDataStatus) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            RouteManager.rPushNamedAndRemoveUntil(
              context: context,
              rName: AppRoutesNames.rHomeScreen,
            );
          case RequestStates.error:
            showSnackBar(
                description: state.error ?? 'something went wrong',
                state: ToastStates.error,
                context: context);
          default:
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Chat App',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 30,
                          fontWeight: FontWeight.w800))),
              PickImageInkWell(
                onPickFile: (value) {
                  file = value;
                },
                onErrorMessage: (value) {
                  errorMessage = value;
                },
                pickImageWidget: PickImgWidget(
                  pickImageErrorMessage: errorMessage,
                ),
                pickImageShape: PickImageShape.bottomSheet,
                loadingPickImageWidget: const LoadingWidget(),
                errorPickImageWidget: StatefulBuilder(
                  builder: (context, sState) {
                    return PickImgWidget(
                      pickImageErrorMessage: errorMessage,
                    );
                  },
                ),
                loadedPickImageWidget: PickImgWidget(
                  pickImageErrorMessage: errorMessage,
                ),
                permissionDialogMessage:
                    'for pick image let me access your gallery',
              ),
              TextFieldNameWidget(_nameController),
              DefaultButtonWidget(
                label: 'Save Data',
                onPressed: () {
                  context.read<ImagePickBloc>().imageFile == null
                      ? ''
                      : context.read<ImagePickBloc>().imageFile!.path;
                  if (_nameController.text.isNotEmpty &&
                      context.read<ImagePickBloc>().imageFile != null) {
                    context.read<LoginCubit>().saveUserData(
                          UserModel(
                            name: _nameController.text,
                            imgPath:
                                context.read<ImagePickBloc>().imageFile!.path,
                            phone: getIt<UserLocalDataSource>()
                                .getUserData()
                                ?.phone /* context.read<LoginCubit>().state.user!.phone*/,
                            userId: getIt<UserLocalDataSource>()
                                .getUserData()
                                ?.userId /* context.read<LoginCubit>().state.user!.userId*/,
                          ),
                        );
                  }
                },
                buttonColor: AppColors.darkColor,
              ),
              50.responsiveHeight.sizedBoxHeight,
            ],
          ),
        ),
      ),
    );
  }
}
