import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../Home/CartScreen/body.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);
  static String routeName = '/PaymentScreen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<bool> optionsStatus = [false, false, false];
  int? selectedOption;

  void optionPressed(int x) {
    setState(() {
      if (selectedOption != x) {
        optionsStatus[selectedOption ?? x] = false;
        selectedOption = x;
        optionsStatus[selectedOption!] = true;
      } else {
        optionsStatus[x] = !optionsStatus[x];
        selectedOption = null;
      }
    });
  }

  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => Scaffold(
        backgroundColor: white,
        appBar: AppBar(backgroundColor: premiumColor),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              PaymentTopic(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PaymentOption(
                    onPressed: () {
                      optionPressed(0);
                    },
                    paymentOptionName: "cash",
                    isPressed: selectedOption == null
                        ? false
                        : optionsStatus[selectedOption!] == optionsStatus[0],
                  ),
                  PaymentOption(
                    isPressed: selectedOption == null
                        ? false
                        : optionsStatus[selectedOption!] == optionsStatus[1],
                    onPressed: () {
                      optionPressed(1);
                    },
                    paymentOptionName: "Credit card",
                  ),
                  PaymentOption(
                    isPressed: selectedOption == null
                        ? false
                        : optionsStatus[selectedOption!] == optionsStatus[2],
                    onPressed: () {
                      optionPressed(2);
                    },
                    paymentOptionName: "Paypal",
                  ),
                ],
              ),
              PaymentScreenCreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                isCvvFocused: isCvvFocused,
              ),
              SizedBox(height: 4.h),
              PaymentScreenDetailCardText(),
              Container(
                height: 295.h,
                width: 380.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CreditCardForm(
                  cursorColor: premiumColor,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: (CreditCardModel data) {
                    setState(() {
                      cardHolderName = data.cardHolderName;
                      cardNumber = data.cardNumber;
                      cvvCode = data.cvvCode;
                      expiryDate = data.expiryDate;
                      isCvvFocused = data.isCvvFocused;
                    });
                  },
                  themeColor: premiumColor!,
                  formKey: formKey,
                  cardNumberDecoration: felidDecoration(
                      labelText: 'Number', hintText: 'XXXX XXXX XXXX XXXX'),
                  expiryDateDecoration: felidDecoration(
                      labelText: 'Expired Date', hintText: 'XX/XX'),
                  cvvCodeDecoration:
                      felidDecoration(labelText: 'CVV', hintText: 'XXX'),
                  cardHolderDecoration:
                      felidDecoration(labelText: 'Card Holder Name'),
                ),
              ),
              SizedBox(height: 8.h),
              CartScreenDivider(),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallModelButtonWidget(
                      onPressed: () {},
                      buttonText: "+ Add New Card",
                      buttonTextColor: premiumColor!,
                      buttonColor: white,
                    ),
                    SmallModelButtonWidget(
                      onPressed: () {},
                      buttonText: "Update Card",
                      buttonTextColor: white,
                      buttonColor: premiumColor!,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 8.h)
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentScreenDetailCardText extends StatelessWidget {
  const PaymentScreenDetailCardText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Text(
        "Detail Card",
        style: defaultTextStyle(context).copyWith(
          color: black,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}

class PaymentScreenCreditCardWidget extends StatelessWidget {
  const PaymentScreenCreditCardWidget({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: secondaryColor!, blurRadius: 15.r),
          ],
        ),
        child: CreditCardWidget(
          height: 180.h,
          width: 340.w,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          cardBgColor: premiumColor!,
          // obscureCardNumber: true,
          cardType: CardType.mastercard,
        ),
      ),
    );
  }
}

InputDecoration felidDecoration({
  required String labelText,
  String? hintText,
}) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: premiumColor!,
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: premiumColor!,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: premiumColor!,
      ),
    ),
    // co
    labelText: labelText,
    labelStyle: TextStyle(color: premiumColor),
    hintText: hintText,
  );
}

class PaymentOption extends StatelessWidget {
  final bool isPressed;
  final String paymentOptionName;
  final void Function()? onPressed;
  const PaymentOption({
    Key? key,
    required this.isPressed,
    required this.paymentOptionName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          paymentOptionName,
          style: defaultTextStyle(context).copyWith(
            color: black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(isPressed ? secondaryColor : white),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    );
  }
}

class PaymentTopic extends StatelessWidget {
  const PaymentTopic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 26.h),
      padding: EdgeInsetsDirectional.only(
        start: 11.w,
        end: 11.w,
        top: 26.h,
        bottom: 10.h,
      ),
      child: Text(
        "Payment",
        style: defaultTextStyle(context).copyWith(
          color: black,
          fontWeight: FontWeight.w900,
          fontSize: 35.sp,
        ),
      ),
    );
  }
}
