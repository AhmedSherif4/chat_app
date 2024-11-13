part of '../../login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: AppReference.deviceHeight(context),
            child: Column(
              children: <Widget>[
                ImageLoginWidget(),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'We will send you an ',
                                  style: TextStyle(color: AppColors.purple)),
                              TextSpan(
                                  text: 'SMS code ',
                                  style: TextStyle(
                                      color: AppColors.purple,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'on this mobile number',
                                  style: TextStyle(color: AppColors.purple)),
                            ]),
                          )),
                      TextFieldLoginWidget(
                          phoneController: phoneController, formKey: _formKey),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: LoginButtonWidget(
                            phoneController: phoneController,
                            formKey: _formKey),
                      )
                    ],
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
