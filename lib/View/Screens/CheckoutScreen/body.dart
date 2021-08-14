import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/View/Themes/Colors.dart';
import 'package:shopping_app/helper/MyHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsAndNumbs extends StatelessWidget {
  final int numberOfItems;
  const ItemsAndNumbs({
    Key? key,
    required this.numberOfItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SubTopic(subTopic: "Items"),
        SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: premiumColor,
          radius: 10.r,
          child: Center(
            child: Text(
              numberOfItems.toString(),
              style: defaultTextStyle(context).copyWith(
                color: white,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckoutTotalCardItems extends StatelessWidget {
  final Widget child;
  const CheckoutTotalCardItems({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 326.h,
      width: double.infinity,
      decoration: BoxDecoration(color: white),
      child: child,
    );
  }
}

class CheckoutCartItem extends StatelessWidget {
  final String networkImageUrl;
  final String productName;
  final String productSize;
  final String productColor;
  final int productSalary;
  final int productQuantity;

  const CheckoutCartItem({
    Key? key,
    required this.networkImageUrl,
    required this.productName,
    required this.productSize,
    required this.productColor,
    required this.productSalary,
    required this.productQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Container(
        height: 130.h,
        width: 380.w,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(color: Color(0xffCACACA), blurRadius: 13.r),
            ],
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 165.w,
              height: 130.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    networkImageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.8.h),
                  child: Text(
                    productName,
                    style: defaultTextStyle(context).copyWith(
                      color: black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    "\$" + productSalary.toString(),
                    style: defaultTextStyle(context).copyWith(
                      color: premiumColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 21.2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    children: [
                      Text(
                        "$productSize,$productColor",
                        style: defaultTextStyle(context).copyWith(
                          color: Color(0xff939292),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      SvgPicture.asset(
                        "assets/checkouticon.svg",
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        "$productQuantity",
                        style: defaultTextStyle(context).copyWith(
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String cartType;
  final int last2cardNum;
  final void Function() onPressed;
  const PaymentMethod({
    Key? key,
    required this.cartType,
    required this.last2cardNum,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTopic(subTopic: "Payment Method"),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Container(
            height: 50.h,
            width: 380.w,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [BoxShadow(color: secondaryColor!, blurRadius: 15.r)],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.70.w,
                      vertical: 9.70.h,
                    ),
                    child: Icon(
                      Icons.payment_outlined,
                      color: premiumColor,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 21.w),
                  Text(
                    "$cartType **$last2cardNum",
                    style: defaultTextStyle(context).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: premiumColor,
                    ),
                  ),
                  SizedBox(width: 96.w),
                  CircleAvatar(
                    backgroundColor: secondaryColor,
                    radius: 15.r,
                    child: Center(
                      child: Transform.rotate(
                        alignment: Alignment.center,
                        angle:
                            // ? (pi / -2)
                            // :
                            (pi / -2),
                        child: IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AddressBuyer extends StatelessWidget {
  final String name;
  final String? flagNum;
  final String? subStreet;
  final String street;
  final String province;
  final String city;
  final String country;
  final void Function()? onEditPressed;

  const AddressBuyer({
    Key? key,
    required this.name,
    this.flagNum,
    this.subStreet,
    required this.street,
    required this.city,
    required this.country,
    required this.province,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTopic(
          subTopic: "Shipping Address",
        ),
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Container(
            height: 122.h,
            width: 380.w,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [BoxShadow(color: secondaryColor!, blurRadius: 15.r)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: defaultTextStyle(context).copyWith(
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        height: 58.h,
                        width: 218.w,
                        child: Text(
                          "${flagNum ?? ""}"
                          ",${subStreet ?? ""} \n,$street\n$city, $province, $country.",
                          style: defaultTextStyle(context).copyWith(
                            color: Color(0xff939292),
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 5.w),
                    child: IconButton(
                      onPressed: onEditPressed,
                      icon: CircleAvatar(
                        backgroundColor: secondaryColor,
                        child: Center(
                          child: Icon(
                            Icons.edit_outlined,
                            color: premiumColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SubTopic extends StatelessWidget {
  final String subTopic;
  const SubTopic({
    Key? key,
    required this.subTopic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Text(
        subTopic,
        style: defaultTextStyle(context).copyWith(
            color: black, fontWeight: FontWeight.w500, fontSize: 20.sp),
      ),
    );
  }
}

class CheckoutText extends StatelessWidget {
  const CheckoutText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Text(
        "Checkout",
        style: defaultTextStyle(context).copyWith(
          color: black,
          fontWeight: FontWeight.w900,
          fontSize: 35.sp,
        ),
      ),
    );
  }
}
