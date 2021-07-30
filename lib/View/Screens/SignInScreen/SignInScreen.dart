import 'package:flutter/material.dart';

import 'body.dart';

@immutable
// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  static String routeName = '/SignIn';

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
    final GlobalKey<FormState> formkay= GlobalKey();


  final String assetPathBody = 'assets/SignScreenbg.png';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetPathBody), fit: BoxFit.cover)),
        child: SignInScreenBody(width: width, email: email, password: password,formkay: formkay,),
      ),
    );
  }
}

