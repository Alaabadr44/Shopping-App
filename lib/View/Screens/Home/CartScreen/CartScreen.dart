import 'package:flutter/material.dart';
import 'package:shopping_app/View/Themes/Colors.dart';
import 'package:shopping_app/helper/MyHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sb(h: 25.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 11.w),
            child: Text(
              "Cart",
              style: defaultTextStyle(context).copyWith(
                color: black,
                fontSize: 35.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          sb(h: 20.h),
          // Container(
          //   height: 660.h,
          //   width: double.infinity,
          //   child: ListView.separated(
          //     itemCount: 2,
          //     separatorBuilder: (BuildContext context, int index) {
          //       return sb(h: 20.h);
          //     },
          //     itemBuilder: (BuildContext context, int index) {
          //       return ;
          //     },
          //   ),
          // ),

          cartItem(
            context,
            itemName: "Adidas Boots",
            itemSalary: 35,
            itemType: "Medium,Black",
            itemQuantity: 1,
            itemReviewStarsNum: 4.5,
          ),
        ],
      ),
    );
  }

  Container cartItem(
    BuildContext context, {
    required String? itemName,
    required String? itemType,
    required double? itemSalary,
    double? itemReviewStarsNum,
    void Function()? addPress,
    void Function()? minPress,
    int? itemQuantity,
  }) {
    return Container(
      height: 140.h,
      width: 380.w,
      child: Card(
        child: Row(
          children: [
            // image
            Container(
              height: 130.h,
              width: 170.h,
              // color: premiumColor,
              child: Image.network(
                "https://m.media-amazon.com/images/I/41Leu3gBUFL.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sb(h: 7.8.h),
                  Text(
                    itemName!,
                    style: defaultTextStyle(context).copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                  ),
                  sb(h: 4.33.h),
                  Text(
                    itemType!,
                    style: defaultTextStyle(context).copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: Color(0xff939292),
                    ),
                  ),
                  sb(h: 31.2.h),
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
                        sb(w: 10.w),
                        Container(
                          width: 56.w,
                          height: 21.h,
                          color: premiumColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.star,
                                color: white,
                                size: 13,
                              ),
                              if (itemReviewStarsNum != null)
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            sb(w: 30.w),
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
    );
  }
}
