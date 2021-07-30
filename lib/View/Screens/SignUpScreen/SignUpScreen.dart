import 'package:flutter/material.dart';

import 'body.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/SignUp';

  final String assetPathBody = 'assets/SignScreenbg.png';
  final TextEditingController fullNameSignUpController =
      TextEditingController();
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController phoneNumberSignUpController =
      TextEditingController();
  final TextEditingController passwordSignUpController =
      TextEditingController();

  final GlobalKey<FormState> formkaySignUP = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SignUpScreenBody(
        assetPathBody: assetPathBody,
        formkaySignUP: formkaySignUP,
        width: width,
        fullNameSignUpController: fullNameSignUpController,
        emailSignUpController: emailSignUpController,
        phoneNumberSignUpController: phoneNumberSignUpController,
        passwordSignUpController: passwordSignUpController,
      ),
    );
  }
}
