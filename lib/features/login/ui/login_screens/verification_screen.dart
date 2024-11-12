import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import '../../../../config/resources/app_colors.dart';
import '../../logic/login_cubit/login_cubit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  Widget otpNumberWidget(
    int position,
    String text,
  ) {
    try {
      return Container(
        height: 40.responsiveHeight,
        width: 40.responsiveWidth,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.purple2.withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.purple,
              size: 16.responsiveSize,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                'Enter 6 digits verification code sent to your number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26.responsiveFontSize,
                                    fontWeight: FontWeight.w500))),
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: 500.responsiveWidth),
                          child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                otpNumberWidget(0, state.text),
                                otpNumberWidget(1, state.text),
                                otpNumberWidget(2, state.text),
                                otpNumberWidget(3, state.text),
                                otpNumberWidget(4, state.text),
                                otpNumberWidget(5, state.text),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  VerificationButton(),
                  NumericKeyboard(
                    onKeyboardTap: (String value) {
                      context.read<LoginCubit>().onKeyboardTap(value);
                    },
                    textColor: AppColors.purple2,
                    rightIcon: Icon(
                      Icons.backspace,
                      color: AppColors.purple2,
                    ),
                    rightButtonFn: () {
                      context.read<LoginCubit>().rightButtonFn();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
