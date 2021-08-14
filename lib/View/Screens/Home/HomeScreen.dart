import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Home/home_cubit.dart';
import 'widgets/HomePageWidgets.dart';

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
        // return Directionality(
        // textDirection: TextDirection.rtl,
        // child: Scaffold());
        return Scaffold(
          appBar: cubit.homeAppBar,
          body: SafeArea(
            child: cubit.screens[cubit.currentIndex],
          ),
          bottomNavigationBar: HomeBottomNavigationBar(),
        );
      },
    );
  }
}
