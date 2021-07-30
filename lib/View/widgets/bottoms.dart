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
