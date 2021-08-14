import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../DeliveryStatus/DeliveryStatus.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({Key? key}) : super(key: key);
  static String routeName = '/OrderPlaced';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: premiumColor,
          ),
          OrderPlacedCircleShape(
            hight: 49.h,
            width: 40.w,
            top: 123.h,
            left: 171.w,
          ),
          OrderPlacedCircleShape(
            hight: 10.h,
            width: 10.w,
            left: 81.w,
            top: 323.h,
          ),
          OrderPlacedCircleShape(
            hight: 20.h,
            width: 20.w,
            top: 313.h,
            left: 331.w,
          ),
          OrderPlacedCircleShape(
            hight: 20.h,
            width: 20.w,
            left: 331.w,
            top: 563.h,
          ),
          OrderPlacedCircleShape(
            hight: 30.h,
            width: 30.w,
            left: 321.w,
            top: 753.h,
          ),
          OrderPlacedCircleShape(
            hight: 10.h,
            width: 10.w,
            left: 201.w,
            top: 803.h,
          ),
          OrderPlacedCircleShape(
            hight: 30.h,
            width: 30.w,
            top: 723.h,
            left: 71.w,
          ),
          OrderPlacedPic(),
          OrderPlacedTextOrderPlaced(),
          OrderPlacedTextOrderDescription(
              description:
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'),
          OrderPlacedButton(
            buttonText: "Delivery Status",
            onPressed: () {
              print("Pressed");
              nav(context: context, routeName: DeliveryStatus.routeName);
            },
          )
        ],
      ),
    );
  }
}

class OrderPlacedButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const OrderPlacedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 623.h,
      left: 92.w,
      height: 50.h,
      width: 230.w,
      child: Container(
        height: 50.h,
        width: 230.w,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: defaultTextStyle(context).copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: premiumColor,
            ),
          ),
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(white),
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

class OrderPlacedTextOrderDescription extends StatelessWidget {
  final String description;
  const OrderPlacedTextOrderDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 494.h,
      left: 96.w,
      height: 40.h,
      width: 223.w,
      child: Text(
        description,
        style: defaultTextStyle(context).copyWith(
            color: white, fontSize: 17.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class OrderPlacedTextOrderPlaced extends StatelessWidget {
  const OrderPlacedTextOrderPlaced({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 431.h,
      left: 95,
      height: 41.h,
      child: Text(
        "Order Placed!",
        style: defaultTextStyle(context).copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 35.sp,
          color: white,
          // height: 41.h,
        ),
      ),
    );
  }
}

class OrderPlacedPic extends StatelessWidget {
  const OrderPlacedPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 233.h,
      left: 132.h,
      child: SvgPicture.asset(
        "assets/Group 240.svg",
        height: 150,
        width: 150,
        color: white,
      ),
    );
  }
}

class OrderPlacedCircleShape extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? hight;
  final double? width;

  const OrderPlacedCircleShape({
    Key? key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.hight,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      height: hight,
      width: width,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: secondaryColor!.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
