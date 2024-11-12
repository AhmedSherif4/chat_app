part of '../../login.dart';

class LoginButtonWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  const LoginButtonWidget({
    super.key,
    required this.phoneController,
    required this.formKey,
  });

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state.verifyPhoneNumberStatus) {
            case RequestStates.loaded:
              Navigator.pop(context);
              RouteManager.rPushNamed(
                context: context,
                rName: AppRoutesNames.rVerificationScreen,
              );
            case RequestStates.error:
              Navigator.pop(context);
              showSnackBar(
                  description: state.error ??
                      'Something went wrong, please try again later...',
                  state: ToastStates.error,
                  context: context);
            case RequestStates.loading:
              showLoadingDialog(context);
            default:
          }
        },
        child: ElevatedButton(
          onPressed: () {
            if (!widget.formKey.currentState!.validate()) {
              showSnackBar(
                  description: 'Please enter a phone number',
                  state: ToastStates.warning,
                  context: context);
            } else {
              context.read<LoginCubit>().getCodeWithPhoneNumber(
                  widget.phoneController.text.toString());
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              padding: const EdgeInsets.all(0)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: AppColors.purple2,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ImageLoginWidget extends StatelessWidget {
  const ImageLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.responsiveSize),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 240,
                    constraints: BoxConstraints(maxWidth: 500.responsiveWidth),
                    margin: EdgeInsets.only(top: 100.responsiveHeight),
                    decoration: BoxDecoration(
                      color: AppColors.white2,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.responsiveSize),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      constraints: const BoxConstraints(maxHeight: 340),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(Assets.imagesLogin)),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Chat App',
                  style: TextStyle(
                      color: AppColors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.w800)))
        ],
      ),
    );
  }
}

class TextFieldLoginWidget extends StatefulWidget {
  const TextFieldLoginWidget({
    super.key,
    required this.phoneController,
    required this.formKey,
  });

  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  @override
  State<TextFieldLoginWidget> createState() => _TextFieldLoginWidgetState();
}

class _TextFieldLoginWidgetState extends State<TextFieldLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Form(
        key: widget.formKey,
        child: CupertinoTextFormFieldRow(
          validator: (value) {
            final regex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');
            if (!regex.hasMatch(value ?? '')) {
              return 'Please enter a valid Egyptian phone number';
            }
            return null;
          },
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          controller: widget.phoneController,
          keyboardType: TextInputType.phone,
          maxLines: 1,
          placeholder: '+20...',
        ),
      ),
    );
  }
}

class VerificationButton extends StatelessWidget {
  const VerificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state.validateOtpAndLoginStatus) {
          case RequestStates.loaded:
            getIt<AppPreferences>().getUserDataAddedStatus()
                ? RouteManager.rPushNamedAndRemoveUntil(
                    context: context, rName: AppRoutesNames.rHomeScreen)
                : RouteManager.rPushNamedAndRemoveUntil(
                    context: context, rName: AppRoutesNames.rFillUserData);
          case RequestStates.error:
            Navigator.pop(context);
            showSnackBar(
                description: state.error ??
                    'Something went wrong, please try again later...',
                state: ToastStates.error,
                context: context);
          case RequestStates.loading:
            showLoadingDialog(context);
          default:
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 500),
        child: ElevatedButton(
          onPressed: () {
            context
                .read<LoginCubit>()
                .validateOtpAndLogin(context.read<LoginCubit>().state.text);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              padding: const EdgeInsets.all(0)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: AppColors.purple2,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldNameWidget extends StatefulWidget {
  final TextEditingController nameController;

  const TextFieldNameWidget(this.nameController, {super.key});

  @override
  State<TextFieldNameWidget> createState() => _TextFieldNameWidgetState();
}

class _TextFieldNameWidgetState extends State<TextFieldNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: CupertinoTextField(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        controller: widget.nameController,
        keyboardType: TextInputType.name,
        maxLines: 1,
        placeholder: 'your name...',
      ),
    );
  }
}
