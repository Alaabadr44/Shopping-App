import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/MyHelper.dart';
import '../Themes/Colors.dart';

Padding customTextFelid({
  required double widthScreen,
  required BuildContext context,
  required String hintextValue,
  String? prefixPathIco,
  required TextEditingController controller,
  required String? Function(String?)? validator,
  Widget? suffixIco,
  IconData? prefixIco,
  TextInputType? keyboardTypeAction,
  Function(String)? onSubmitted,
  bool? obscureText,
  Function()? passwordShow,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthScreen / 10),
    child: TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: white,
            width: 3.0,
          ),
        ),
        hintText: hintextValue.padLeft(5),
        hintStyle: defaultTextStyle(context).copyWith(
            color: Colors.grey.withOpacity(0.7),
            fontSize: 20.sp,
            fontWeight: FontWeight.w300),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: prefixPathIco != null
              ? SizedBox(
                  child: Container(
                    // height: 24.h,
                    // width: 24.w,
                    child: SvgPicture.asset(
                      prefixPathIco,
                      color: white,
                      height: 24.0.h,
                      width: 24.0.w,
                    ),
                  ),
                )
              : Icon(prefixIco,color: Colors.white,size: 24,),
        ),
        suffixIcon: suffixIco != null
            ? IconButton(onPressed: passwordShow ?? () {}, icon: suffixIco)
            : SizedBox(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: white, width: 3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: white, width: 3),
        ),
      ),
      controller: controller,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      cursorColor: white,
      keyboardType: keyboardTypeAction,
      obscureText: obscureText ?? false,
      maxLines: 1,
      style: defaultTextStyle(context)
          .copyWith(color: white, fontSize: 20.sp, fontWeight: FontWeight.w500),
    ),
  );
}
