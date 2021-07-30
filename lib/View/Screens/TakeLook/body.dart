import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../../widgets/bottoms.dart';
import '../SignInScreen/SignInScreen.dart';

class BodyTakeALook extends StatelessWidget {
  const BodyTakeALook({
    Key? key,
  }) : super(key: key);
  final assetPath = 'assets/1.png';


  @override
  Widget build(BuildContext context) {
 double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sb(h: 102.h),
          Center(
            child: Image.asset(
              assetPath,
            ),
          ),
          sb(h: 40.h),
          Text(
            " Shopping",
            style: GoogleFonts.roboto().copyWith(
                fontSize: 55.sp,
                color: Color(0xff280138),
                fontWeight: FontWeight.w900),
          ),
          sb(h: 31.h),
          mainButton(
            context: context,
            textColor: white,
            buttonColor: thirdColor,
            textButton: 'Take a look',
            onPressed: () {
               print("h: $_height \t \n \t w:$_width  \t \n \t p: $paddingTop");
            },
          ),
          sb(h: 55.h),
          customTextButton(
            context: context,
            onPressed: () => navAndFinish(
              context: context,
              routeName: SignInScreen.routeName,
            ),
            textColor: thirdColor,
            textButton: 'Log in',
          )
        ],
      ),
    );
  }
}
