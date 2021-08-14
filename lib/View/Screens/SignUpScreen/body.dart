import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controller/Auth/auth_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../../widgets/bottoms.dart';
import '../../widgets/felid.dart';
import '../../widgets/texts.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    Key? key,
    required this.assetPathBody,
    required this.formkaySignUP,
    required this.width,
    required this.fullNameSignUpController,
    required this.emailSignUpController,
    required this.phoneNumberSignUpController,
    required this.passwordSignUpController,
  }) : super(key: key);

  final String assetPathBody;
  final GlobalKey<FormState> formkaySignUP;
  final double width;
  final TextEditingController fullNameSignUpController;
  final TextEditingController emailSignUpController;
  final TextEditingController phoneNumberSignUpController;
  final TextEditingController passwordSignUpController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetPathBody), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Form(
            key: formkaySignUP,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(height: 110.h),
                Center(child: shopping(x: white)),
            SizedBox(height: 75.h),
                Container(
                    padding: EdgeInsetsDirectional.only(start: width / 10),
                    child: loginOrSignUp(context, 'Sign up', width)),
            SizedBox(height: 43.h),
                customTextFelid(
                  widthScreen: width,
                  context: context,
                  hintextValue: 'Full Name',
                  prefixPathIco: 'assets/Group 5.svg',
                  controller: fullNameSignUpController,
                  validator: (x) => validator(text: x, isFullName: true),
                  keyboardTypeAction: TextInputType.name,
                ),
            SizedBox(height: 40.h),
                customTextFelid(
                  widthScreen: width,
                  context: context,
                  hintextValue: "email",
                  prefixPathIco: "assets/Group 6 (1).svg",
                  controller: emailSignUpController,
                  validator: (x) => validator(text: x, isEmail: true),
                  keyboardTypeAction: TextInputType.emailAddress,
                ),
            SizedBox(height: 40.h),
                customTextFelid(
                  widthScreen: width,
                  context: context,
                  hintextValue: "Phone Number",
                  prefixPathIco: "assets/Group 15.svg",
                  controller: phoneNumberSignUpController,
                  validator: (x) => validator(text: x, isPhone: true),
                  keyboardTypeAction: TextInputType.phone,
                ),
            SizedBox(height: 40.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    AuthCubit cubit = AuthCubit.get(context);
                    return customTextFelid(
                      widthScreen: width,
                      context: context,
                      hintextValue: 'Password',
                      prefixPathIco: 'assets/password.svg',
                      suffixIco: Icon(
                        cubit.isPasswordShown
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: white.withOpacity(0.6),
                      ),
                      passwordShow: cubit.changeVisibilityPass,
                      controller: passwordSignUpController,
                      validator: (String? x) =>
                          validator(text: x!, isPassword: true),
                      obscureText: cubit.isPasswordShown,
                      keyboardTypeAction: TextInputType.visiblePassword,
                    );
                  },
                ),
            SizedBox(height: 60.h),
                Center(
                  child: mainButton(
                    context: context,
                    textButton: "Continue",
                    textColor: thirdColor,
                    buttonColor: white,
                    onPressed: () {
                      if (formkaySignUP.currentState!.validate()) {
                        //? when done backend come here
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
