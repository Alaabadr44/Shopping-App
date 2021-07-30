import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../View/Screens/HomeScreen/Home/HomeForHomeScreen.dart';
import '../../View/Screens/HomeScreen/Messages/MessagesForHomeScreen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static get(context) => BlocProvider.of<HomeCubit>(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomeForHomeScreen(),
    MessagesForHomeScreen(),
  ];

  double? elevation = 4;

  void changePressBottomBarIcon(int x) {
    currentIndex = x;
    if (x == 1)
      elevation = 0;
    else
      elevation = 4;
    emit(ChangePressBottomBarIcon());
  }
}
