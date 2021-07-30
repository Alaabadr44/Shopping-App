import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/MyHelper.dart';
import '../Themes/Colors.dart';

Text shopping({required Color x, double? hight}) {
  return Text(
    " Shopping",
    // style: TextStyle(color: Color(0xff280138)),
    style: GoogleFonts.roboto().copyWith(
        fontSize: 55.sp, color: x, fontWeight: FontWeight.w900, height: hight),
  );
}

Text loginOrSignUp(BuildContext context, String x, double width) {
  return Text(
    x,
    style: defaultTextStyle(context)
        .copyWith(color: white, fontSize: 30.sp, fontWeight: FontWeight.w400),
  );
}

Padding mainBigTopic(double _width, BuildContext context, String topic) {
  return Padding(
    padding: EdgeInsetsDirectional.only(start: _width * 0.05),
    child: Text(
      topic,
      style: defaultTextStyle(context).copyWith(
        color: black,
        fontSize: 35.sp,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
