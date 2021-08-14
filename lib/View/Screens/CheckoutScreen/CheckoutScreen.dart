import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../Home/CartScreen/body.dart';
import '../OrderPlaced/OrderPlaced.dart';
import '../paymentScreen/paymentScreen.dart';
import 'body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static String routeName = '/CheckoutScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: premiumColor,
          backwardsCompatibility: true,
          elevation: 0,
          toolbarHeight: 40,
        ),
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              CheckoutText(),
              SizedBox(height: 10.h),
              AddressBuyer(
                name: "Christine Ortiz",
                flagNum: "No123",
                subStreet: "Sub Street",
                street: "Main Street",
                city: "city",
                country: "country",
                province: "province",
                onEditPressed: () {},
              ),
              SizedBox(height: 8.h),
              PaymentMethod(
                cartType: "Master Card",
                last2cardNum: 49,
                onPressed: () => navAndFinish(
                  context: context,
                  routeName: PaymentScreen.routeName,
                ),
              ),
              SizedBox(height: 13.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemsAndNumbs(numberOfItems: 3),
                  SizedBox(height: 14.h),
                  CheckoutTotalCardItems(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
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
                  )
                ],
              ),
              CartScreenDivider(),
              TotalAndCheckoutRowPart(
                checkoutSalary: "135.00",
                checkoutPressed: () {
                  //? do whet u do then go to OrderPlacedScreen
                  navAndFinish(
                      context: context, routeName: OrderPlaced.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
