import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../CheckoutScreen/body.dart';
import '../Home/CartScreen/body.dart';

class DeliveryStatus extends StatelessWidget {
  const DeliveryStatus({Key? key}) : super(key: key);
  static String routeName = '/DeliveryStatus';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: premiumColor,
      ),
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          DeliveryStatusTopic(),
          SizedBox(height: 30.h),
          DeliveryStatusRowTextsStatus(),
          SizedBox(height: 25.h),
          DeliveryStatusBar(),
          SizedBox(height: 25.h),
          DeliveryStatusDataRow(),
          SizedBox(height: 20.h),
          DeliveryScreenDivider(),
          DeliveryStatusItemsAndOrderNumberBar(),
          SizedBox(height: 15.h),
          DeliveryStatusCardItemsPositions(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return CheckoutCartItem(
                  networkImageUrl:
                      "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/e725107a3d7041389f94ab220123fbcb_9366/Bravada_Shoes_Black_FV8085_01_standard.jpg",
                  productName: "Adidas Boots",
                  productSize: "M",
                  productColor: "Black",
                  productSalary: 35,
                  productQuantity: 1,
                );
              },
            ),
          ),
          CartScreenDivider(),
          DeliveryStatusBottomsBar()
        ],
      ),
    );
  }
}

class DeliveryStatusCardItemsPositions extends StatelessWidget {
  final Widget child;
  const DeliveryStatusCardItemsPositions({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 426.h,
      width: double.infinity,
      color: white,
      child: child,
    );
  }
}

class DeliveryStatusBottomsBar extends StatelessWidget {
  const DeliveryStatusBottomsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SmallModelButtonWidget(
            onPressed: () {},
            buttonText: "Cancel Order",
            buttonTextColor: premiumColor!,
            buttonColor: white),
        SmallModelButtonWidget(
            onPressed: () {},
            buttonText: "Message",
            buttonTextColor: white,
            buttonColor: premiumColor!),
      ],
    );
  }
}

class DeliveryStatusItemsAndOrderNumberBar extends StatelessWidget {
  const DeliveryStatusItemsAndOrderNumberBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemsAndNumbs(numberOfItems: 3),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 2.w),
            child: Text(
              "Order ID #848039",
              style: defaultTextStyle(context).copyWith(
                color: Color(0xff7B7B7B),
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryScreenDivider extends StatelessWidget {
  const DeliveryScreenDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Divider(
        color: Color(0xff939292),
        thickness: 2,
      ),
    );
  }
}

class DeliveryStatusDataRow extends StatelessWidget {
  const DeliveryStatusDataRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.h),
          child: Text(
            "Portal packed for sanding",
            style: defaultTextStyle(context).copyWith(
              color: Color(0xff5E5E5E),
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
            ),
          ),
        ),
        SizedBox(width: 90.w),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 12.w),
          child: Text(
            "30 Apr,2019",
            style: defaultTextStyle(context).copyWith(
              color: Color(0xff5E5E5E),
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
            ),
          ),
        )
      ],
    );
  }
}

class DeliveryStatusBar extends StatelessWidget {
  const DeliveryStatusBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            height: 2.h,
            width: double.infinity,
            color: black,
          ),
          // DeliveryStatusInactiveIcon(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DeliveryStatusDoneIcon(),
              DeliveryStatusDoneLine(),
              DeliveryStatusDoneIcon(),
              DeliveryStatusDoneLine(),
              DeliveryStatusProcessingIcon(),
              DeliveryStatusInactiveLine(),
              DeliveryStatusInactiveIcon(),
            ],
          ),
        ],
      ),
    );
  }
}

class DeliveryStatusInactiveLine extends StatelessWidget {
  const DeliveryStatusInactiveLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: 100.w,
      color: Color(0xff939292),
    );
  }
}

class DeliveryStatusDoneLine extends StatelessWidget {
  const DeliveryStatusDoneLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: 100.w,
      color: premiumColor,
    );
  }
}

class DeliveryStatusInactiveIcon extends StatelessWidget {
  const DeliveryStatusInactiveIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: white,
        border: Border.all(
          color: Color(0xff939292),
          width: 1.5.w,
        ),
      ),
    );
  }
}

class DeliveryStatusProcessingIcon extends StatelessWidget {
  const DeliveryStatusProcessingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: white,
      ),
      child: Center(
        child: Container(
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: premiumColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: secondaryColor!,
                blurRadius: 10.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryStatusDoneIcon extends StatelessWidget {
  const DeliveryStatusDoneIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: premiumColor,
      ),
      child: Center(
        child: Icon(
          Icons.done,
          color: white,
          size: 18,
        ),
      ),
    );
  }
}

class DeliveryStatusRowTextsStatus extends StatelessWidget {
  const DeliveryStatusRowTextsStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DeliveryStatusTextStatus(status: "PLACE ORDER"),
        DeliveryStatusTextStatus(status: "INVOICE"),
        DeliveryStatusTextStatus(status: "PICK&PACK"),
        DeliveryStatusTextStatus(status: "DELIVERY"),
      ],
    );
  }
}

class DeliveryStatusTextStatus extends StatelessWidget {
  final String status;
  const DeliveryStatusTextStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: defaultTextStyle(context).copyWith(
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
      ),
    );
  }
}

class DeliveryStatusTopic extends StatelessWidget {
  const DeliveryStatusTopic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Text(
        "Delivery Status",
        style: defaultTextStyle(context).copyWith(
          color: black,
          fontWeight: FontWeight.w900,
          fontSize: 35.sp,
        ),
      ),
    );
  }
}
