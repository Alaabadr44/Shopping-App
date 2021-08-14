import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/MyHelper.dart';

//?Continue
Container mainButton({
  required BuildContext context,
  required String textButton,
  required Color? textColor,
  required Color? buttonColor,
  required Function()? onPressed,
}) {
  return Container(
    width: 324.06.w,
    height: 56.h,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        textButton,
        style: defaultTextStyle(context).copyWith(
            fontSize: 30.sp, fontWeight: FontWeight.w400, color: textColor),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  );
}

//! Sign up
TextButton customTextButton({
  required BuildContext context,
  required Function()? onPressed,
  required Color? textColor,
  required String textButton,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      textButton,
      style: defaultTextStyle(context).copyWith(
        fontSize: 30.sp,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    ),
  );
}

class SmallModelButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  const SmallModelButtonWidget({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 170.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff8B8B8B),
          blurRadius: 15.r,
        ),
      ], color: buttonColor),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: defaultTextStyle(context).copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            color: buttonTextColor,
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          // shadowColor: MaterialStateProperty.all(
          //   // Color(0xff8B8B8B),
          //   // Colors.red,
          // ),
        ),
      ),
    );
  }
}
