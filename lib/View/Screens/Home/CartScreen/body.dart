import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../helper/MyHelper.dart';
import '../../../Themes/Colors.dart';

class PageBody extends StatelessWidget {
  final Widget child;
  const PageBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: child,
      ),
    );
  }
}

class CartTopicScreen extends StatelessWidget {
  const CartTopicScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 11.w),
      child: Text(
        "Cart",
        style: defaultTextStyle(context).copyWith(
          color: black,
          fontSize: 35.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class CartItemsSpace extends StatelessWidget {
  final Widget child;
  const CartItemsSpace({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      width: double.infinity,
      child: child,
    );
  }
}

class TotalAndCheckoutRowPart extends StatelessWidget {
  final String checkoutSalary;
  final void Function()? checkoutPressed;
  const TotalAndCheckoutRowPart({
    Key? key,
    required this.checkoutSalary,
    required this.checkoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 17.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TotalSchemaWord(),
              SizedBox(height: 7.h),
              CheckoutSalary(
                checkoutSalary: checkoutSalary,
              ),
            ],
          ),
          SizedBox(width: 117.w),
          SmallModelButtonWidget(
            onPressed: checkoutPressed,
            buttonColor: premiumColor!,
            buttonText: "Checkout",
            buttonTextColor: white,
          ),
        ],
      ),
    );
  }
}

class DeliveryRowPart extends StatelessWidget {
  final String? deliveryCostSalary;
  final String deliveryStatus;
  const DeliveryRowPart({
    Key? key,
    required this.deliveryCostSalary,
    required this.deliveryStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 17.w,
        vertical: 22.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DeliveryCost(deliveryCost: deliveryCostSalary),
          SizedBox(width: 134.w),
          DeliveryTypeText(),
          SizedBox(width: 20.w),
          DeliveryTypeTextStatus(
            deliveryStatus: deliveryStatus,
          ),
        ],
      ),
    );
  }
}

class PromoCodeRowPart extends StatelessWidget {
  final TextEditingController promoCode;
  final Function() validatePromoCode;
  const PromoCodeRowPart({
    Key? key,
    required this.promoCode,
    required this.validatePromoCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Row(
        children: [
          PromoCodeTextField(
            promoCodeController: promoCode,
            submitted: (_) => validatePromoCode(),
          ),
          SizedBox(width: 83.w),
          PromoCodeButton(
            onPress: () => validatePromoCode(),
          )
        ],
      ),
    );
  }
}

class TotalSchemaWord extends StatelessWidget {
  const TotalSchemaWord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        "TOTAL",
        style: defaultTextStyle(context).copyWith(
          color: Color(0xff939292),
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}

class CheckoutSalary extends StatelessWidget {
  final String checkoutSalary;
  const CheckoutSalary({
    Key? key,
    required this.checkoutSalary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$" + checkoutSalary,
      style: defaultTextStyle(context).copyWith(
        color: Color(0xff2D2D2D),
        fontWeight: FontWeight.w500,
        fontSize: 25.sp,
      ),
    );
  }
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
        ),
      ),
    );
  }
}

class DeliveryTypeTextStatus extends StatelessWidget {
  final String deliveryStatus;
  const DeliveryTypeTextStatus({
    Key? key,
    required this.deliveryStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 90.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xff8B8B8B),
            blurRadius: 5,
          ),
        ],
      ),
      child: Text(
        deliveryStatus,
        style: defaultTextStyle(context).copyWith(
          color: premiumColor,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}

class DeliveryTypeText extends StatelessWidget {
  const DeliveryTypeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Delivery type",
      style: defaultTextStyle(context).copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
      ),
    );
  }
}

class DeliveryCost extends StatelessWidget {
  final String? deliveryCost;
  const DeliveryCost({
    Key? key,
    this.deliveryCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      deliveryCost ?? "\$0.00",
      style: defaultTextStyle(context).copyWith(
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
    );
  }
}

class PromoCodeButton extends StatelessWidget {
  final void Function()? onPress;
  const PromoCodeButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 112.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff8B8B8B),
            blurRadius: 5,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          "Apply code",
          style: defaultTextStyle(context).copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: premiumColor,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(white),
          side: MaterialStateProperty.all(
            BorderSide(
              color: thirdColor!,
              width: 1.w,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCodeTextField extends StatelessWidget {
  final TextEditingController? promoCodeController;
  final void Function(String)? submitted;
  const PromoCodeTextField({
    Key? key,
    required this.promoCodeController,
    required this.submitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 185.w,
      child: TextField(
        onSubmitted: submitted,
        controller: promoCodeController,
        style: defaultTextStyle(context).copyWith(
          color: white,
          fontWeight: FontWeight.w400,
          fontSize: 20.sp,
          decoration: TextDecoration.none,
        ),
        onChanged: (String? text) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
          hintText: "Add Promo Code",
          hintStyle: defaultTextStyle(context).copyWith(
            color: Color(0xff585858),
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            decoration: TextDecoration.none,
          ),
          filled: true,
          fillColor: Color(0xff939292),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
                // color: Color(0xff939292),
                ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: Color(0xff939292),
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: Color(0xff939292),
              width: 2.0,
            ),
          ),
        ),
        cursorColor: black,
        cursorHeight: 20.h,
      ),
    );
  }
}

class CartScreenDivider extends StatelessWidget {
  const CartScreenDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Divider(
        color: Color(0xff939292),
        thickness: 1,
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String? itemName;
  final String? itemType;
  final double? itemSalary;
  final ObjectKey dismissibleKey;
  final Function swapDelete;

  final String? itemPhotoUrl;
  final double? itemReviewStarsNum;
  final void Function()? addPress;
  final void Function()? minPress;
  final int? itemQuantity;

  const CartItem({
    Key? key,
    required this.itemName,
    required this.itemType,
    required this.itemSalary,
    required this.dismissibleKey,
    required this.swapDelete,
    this.itemPhotoUrl,
    this.itemReviewStarsNum,
    this.addPress,
    this.minPress,
    this.itemQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Dismissible(
        secondaryBackground: Container(
          height: 50.h,
          width: 50.w,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Container(
            child: SvgPicture.asset("assets/delete.svg"),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffF2E6F8),
                  blurRadius: 40,
                  // spreadRadius: 15,
                ),
              ],
            ),
          ),
        ),
        background: SizedBox(),
        onDismissed: (DismissDirection x) {
          if (x == DismissDirection.endToStart) swapDelete();
        },
        direction: DismissDirection.endToStart,
        key: dismissibleKey,
        child: Container(
          height: 140.h,
          width: 380.w,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffCACACA),
                blurRadius: 13,
              ),
            ],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              // image
              Container(
                height: 130.h,
                width: 170.h,
                // color: premiumColor,
                child: Image.network(
                  itemPhotoUrl ?? "",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7.8.h),
                    Text(
                      itemName!,
                      style: defaultTextStyle(context).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: black,
                      ),
                    ),
                    SizedBox(height: 4.33.h),
                    Text(
                      itemType!,
                      style: defaultTextStyle(context).copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Color(0xff939292),
                      ),
                    ),
                    SizedBox(height: 31.2.h),
                    Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 24.4.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$" + itemSalary!.round().toString(),
                            style: defaultTextStyle(context).copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: black,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          if (itemReviewStarsNum != null)
                            Container(
                              width: 50.w,
                              height: 21.h,
                              decoration: BoxDecoration(
                                color: premiumColor,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: white,
                                    size: 13,
                                  ),
                                  SizedBox(width: 1.w),
                                  Text(
                                    itemReviewStarsNum.toString(),
                                    style: defaultTextStyle(context).copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 30.w),
              Column(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 20,
                        color: Color(0xffA1A1A1),
                      ),
                      onPressed: addPress ?? () {},
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: premiumColor!),
                    ),
                    child: Center(
                      child: Text(
                        itemQuantity.toString(),
                        style: defaultTextStyle(context).copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.minimize,
                        size: 20,
                        color: Color(0xffA1A1A1),
                      ),
                      onPressed: minPress ?? () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
