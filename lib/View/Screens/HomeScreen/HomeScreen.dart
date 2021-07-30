import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Home/home_cubit.dart';
import '../../../helper/MyHelper.dart';
import 'HomePageWidgets.dart';
import 'notifications/notifications.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  double? elevation;
    static String routeName = "/HomeScreen";


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        elevation = cubit.elevation;
        return Scaffold(
          appBar: homeAppBarScreen(
            context,
            3,
            elevation: elevation,
            notificationsPress: () => navAndFinish(
                context: context, routeName: NotificationsScreen.routeName,),
          ),
          body: SafeArea(
            child: cubit.screens[cubit.currentIndex],
          ),
          bottomNavigationBar: bottomNavigationBar(),
        );
      },
    );
  }
}
