import 'package:flutter/material.dart';

import '../Screens/All%20Categories/AllCategoriesScreen.dart';
import '../Screens/ChatScreen/ChatScreen.dart';
import '../Screens/CheckoutScreen/CheckoutScreen.dart';
import '../Screens/DeliveryStatus/DeliveryStatus.dart';
import '../Screens/Home/HomeScreen.dart';
import '../Screens/Home/notifications/notifications.dart';
import '../Screens/NoInternetConnection/NoInternetConnection.dart';
import '../Screens/OrderPlaced/OrderPlaced.dart';
import '../Screens/SignInScreen/SignInScreen.dart';
import '../Screens/SignUpScreen/SignUpScreen.dart';
import '../Screens/TakeLook/Takelook.dart';
import '../Screens/paymentScreen/paymentScreen.dart';

Map<String, WidgetBuilder> myRoute = {
  TakeLook.routeName: (BuildContext context) => TakeLook(),
  SignInScreen.routeName: (BuildContext context) => SignInScreen(),
  SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
  HomeScreen.routeName:(BuildContext context)=> HomeScreen(),
  NotificationsScreen.routeName:(BuildContext context)=> NotificationsScreen(),
  AllCategoriesScreen.routeName:(BuildContext context)=> AllCategoriesScreen(),
  CheckoutScreen.routeName:(BuildContext context)=> CheckoutScreen(),
  PaymentScreen.routeName:(BuildContext context)=> PaymentScreen(),
  OrderPlaced.routeName:(BuildContext context)=> OrderPlaced(),
  DeliveryStatus.routeName:(BuildContext context)=> DeliveryStatus(),
  NoInternetConnection.routeName:(BuildContext context)=> NoInternetConnection(),
  ChatScreen.routeName:(BuildContext context)=> ChatScreen(),

};
