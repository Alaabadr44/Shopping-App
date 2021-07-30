import 'package:flutter/material.dart';

import '../Screens/All%20Categories/AllCategoriesScreen.dart';
import '../Screens/HomeScreen/HomeScreen.dart';
import '../Screens/HomeScreen/notifications/notifications.dart';
import '../Screens/SignInScreen/SignInScreen.dart';
import '../Screens/SignUpScreen/SignUpScreen.dart';
import '../Screens/TakeLook/Takelook.dart';

Map<String, WidgetBuilder> myRoute = {
  TakeLook.routeName: (BuildContext context) => TakeLook(),
  SignInScreen.routeName: (BuildContext context) => SignInScreen(),
  SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
  HomeScreen.routeName:(BuildContext context)=> HomeScreen(),
  NotificationsScreen.routeName:(BuildContext context)=> NotificationsScreen(),
  AllCategoriesScreen.routeName:(BuildContext context)=> AllCategoriesScreen(),

};
