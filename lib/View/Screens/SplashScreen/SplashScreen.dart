import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../../widgets/texts.dart';

final String assetName = 'assets/Group 1.svg';
final Widget svgIcon = SvgPicture.asset(
  assetName,
);

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: svgIcon,
            ),
            SizedBox(
              height: 12.h,
            ),
            shopping(x: premiumColor!),
            SizedBox(height: 15.h),
            Text(
              'Easier than you think',
              style: defaultTextStyle(context).copyWith(fontSize: 20.sp),
            )
          ],
        ),
      ),
    );
  }
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        } else {
          // Loading is done, return the app:
          return Scaffold(body: Center(child: Text('App loaded')));
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}
*/