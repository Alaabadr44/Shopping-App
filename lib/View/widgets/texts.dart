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



class MainBigTopic extends StatelessWidget {
  final String topic;
  const MainBigTopic({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
}
