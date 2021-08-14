import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/MyHelper.dart';
import '../../CheckoutScreen/CheckoutScreen.dart';
import 'body.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final TextEditingController promoCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          CartTopicScreen(),
          SizedBox(height: 20.h),
          CartItemsSpace(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 20.h),
              itemBuilder: (BuildContext context, int index) => CartItem(
                itemName: "Adidas Boots",
                itemSalary: 35,
                itemType: "Medium,Black",
                itemQuantity: 1,
                itemReviewStarsNum: 4.5,
                itemPhotoUrl:
                    "https://m.media-amazon.com/images/I/41Leu3gBUFL.jpg",
                dismissibleKey: ObjectKey(index),
                swapDelete: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28.h),
            child: CartScreenDivider(),
          ),
          PromoCodeRowPart(
            promoCode: promoCode,
            //! function from cart cubit
            validatePromoCode: () => print(promoCode.text),
          ),
          DeliveryRowPart(
            deliveryCostSalary: null,
            deliveryStatus: "Normal",
          ),
          TotalAndCheckoutRowPart(
            checkoutPressed: () =>
                nav(context: context, routeName: CheckoutScreen.routeName),
            checkoutSalary: "105.00",
          ),
        ],
      ),
    );
  }
}
