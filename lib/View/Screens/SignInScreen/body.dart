import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controller/Auth/auth_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../../widgets/bottoms.dart';
import '../../widgets/felid.dart';
import '../../widgets/texts.dart';
import '../SignUpScreen/SignUpScreen.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    Key? key,
    required this.width,
    required this.email,
    required this.password,
    required this.formkay,
  }) : super(key: key);

  final double width;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formkay;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkay,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height:158.h),
            Center(child: shopping(x: white)),
          SizedBox(height:75.h),
            Padding(
              padding: EdgeInsetsDirectional.only(start: width / 10),
              child: loginOrSignUp(context, 'Log in', width),
            ),
          SizedBox(height:43.h),
            customTextFelid(
                widthScreen: width,
                context: context,
                hintextValue: "Bazzaar@gmail.com",
                // prefixPathIco: 'assets/Group 5.svg',
                prefixIco:
                    Icons.person_outline,
                controller: email,
                validator: (String? x) => validator(text: x!, isEmail: true),
                keyboardTypeAction: TextInputType.emailAddress),
          SizedBox(height:42.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                AuthCubit cubit = AuthCubit.get(context);
                return customTextFelid(
                  widthScreen: width,
                  context: context,
                  hintextValue: 'Password',
                  // prefixPathIco: 'assets/password.svg',
                  prefixIco: Icons.lock_outline_sharp,
                  suffixIco: Icon(
                    cubit.isPasswordShown
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: white.withOpacity(0.6),
                  ),
                  passwordShow: cubit.changeVisibilityPass,
                  controller: password,
                  validator: (String? x) =>
                      validator(text: x!, isPassword: true),
                  obscureText: cubit.isPasswordShown,
                  keyboardTypeAction: TextInputType.visiblePassword,
                );
              },
            ),
          SizedBox(height:66.h),
            Center(
              child: mainButton(
                context: context,
                textButton: 'Continue',
                textColor: thirdColor,
                buttonColor: white,
                onPressed: () {
                  if (formkay.currentState!.validate()) {
                    //? when done backend come here
                  }
                },
              ),
            ),
          SizedBox(height:30.h),
            Center(
              child: customTextButton(
                context: context,
                onPressed: () => navAndFinish(
                    context: context, routeName: SignUpScreen.routeName),
                textColor: white,
                textButton: 'Sign up',
              ),
            )
          ],
        ),
      ),
    );
  }
}
