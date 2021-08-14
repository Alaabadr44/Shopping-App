import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);
  static String routeName = '/NoInternetConnection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: white,
      body: Column(
        children: [
          SizedBox(height: 232.h),
          NoInternetConnectionNoWifiIcon(),
          SizedBox(height: 79.h),
          NoInternetConnectionNoWifiText(),
          SizedBox(height: 51.h),
          NoInternetConnectionNoWifiTryAgainButton()
        ],
      ),
    );
  }
}

class NoInternetConnectionNoWifiTryAgainButton extends StatelessWidget {
  const NoInternetConnectionNoWifiTryAgainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.h,
        width: 230.w,
        decoration: BoxDecoration(
            border: Border.all(color: premiumColor!, width: 2),
            color: secondaryColor),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Try Again",
            style: defaultTextStyle(context).copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: premiumColor,
            ),
          ),
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(secondaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoInternetConnectionNoWifiText extends StatelessWidget {
  const NoInternetConnectionNoWifiText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Text(
        "No Internet Connection",
        style: defaultTextStyle(context).copyWith(
          color: premiumColor,
          fontSize: 35.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class NoInternetConnectionNoWifiIcon extends StatelessWidget {
  const NoInternetConnectionNoWifiIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 162.h,
        width: 162.w,
        decoration: BoxDecoration(
          color: secondaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: premiumColor!,
            width: 5.w,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.wifi_off_outlined,
            color: premiumColor,
            size: 80,
          ),
        ),
      ),
    );
  }
}
