import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';

import '../picker/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String username,
      bool isLogin, BuildContext ctx, File? image) submitfn;
  final bool isLoading;

  const AuthForm({Key? key, required this.submitfn, required this.isLoading})
      : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String email = '';
  String pw = '';
  String username = '';
  File? _userImageFile;

  void _pickImage(File? pickedImage) {
    _userImageFile = pickedImage; // إدينا الصورة للفيرابل دا
  }

  void _submit() {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus(); // بيقفل الكيبورد اول ما الفانكشن تخلص

     

    if (isValid) {
      formKey.currentState!.save();
      widget.submitfn(
          email.trim(), pw.trim(), username.trim(), _isLogin, context, _userImageFile);
    }
   
    if (!_isLogin && _userImageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please pick an image'),
        backgroundColor: Colors.red,
      ));
      return;
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin) UserImagePicker(imagePickfn: _pickImage),
                  TextFormField(
                    key: const ValueKey('email'), // بتميز مابين الحقول وبعضها
                    validator: (val) {
                      if (val!.isEmpty || !val.contains('@')) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    onSaved: (val) => email = val!,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: "Email Address"),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (val) {
                        if (val!.isEmpty || val.length < 4) {
                          return "Please enter at least 4 characters";
                        }
                        return null;
                      },
                      onSaved: (val) => username = val!,
                      decoration: const InputDecoration(labelText: "Username"),
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (val) {
                      if (val!.isEmpty || val.length < 7) {
                        return "Password must be at least 7 characters";
                      }
                      return null;
                    },
                    onSaved: (val) => pw = val!,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(height: 12),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  TextButton(
                    onPressed: _submit,
                    child: Text(_isLogin ? 'Login' : 'Sign up'),
                  ),
                  TextButton(
                    child: Text(_isLogin
                        ? 'Create a new account'
                        : 'I  already have an account'),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                        print('pressed');
                        print(_isLogin);
                      });
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
