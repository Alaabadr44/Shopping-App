import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../View/Screens/Home/AccountScreen/AccountScreen.dart';
import '../../View/Screens/Home/CartScreen/CartScreen.dart';
import '../../View/Screens/Home/Home/HomeForHomeScreen.dart';
import '../../View/Screens/Home/Messages/MessagesForHomeScreen.dart';
import '../../View/Screens/Home/notifications/notifications.dart';
import '../../View/Screens/Home/widgets/HomePageWidgets.dart';
import '../../helper/MyHelper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static get(context) => BlocProvider.of<HomeCubit>(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomeForHomeScreen(),
    MessagesForHomeScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  double? elevation = 4;

  AppBar? homeAppBar;

  void changePressBottomBarIcon(
    int x,
    context,
  ) {
    currentIndex = x;
    if (x == 1 || x == 2) {
      elevation = 0;
      homeAppBar = homeAppBarScreen(
        context,
        3,
        elevation: elevation,
        notificationsPress: () => navAndFinish(
            context: context,
            routeName: NotificationsScreen.routeName,
            data: {"x": x}),
      );
    } else if (x == 3) {
      homeAppBar = null;
    } else {
      elevation = 4;
      homeAppBar = homeAppBarScreen(
        context,
        3,
        elevation: elevation,
        notificationsPress: () => navAndFinish(
          context: context,
          routeName: NotificationsScreen.routeName,
        ),
      );
    }
    emit(ChangePressBottomBarIcon());
  }
}
