import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../View/Themes/Colors.dart';

part 'categoriescubit_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static get(context) => BlocProvider.of<CategoriesCubit>(context);

  int? categoryPressItem;
  String? secondWord;
  void categoryPress(int index, String word) {
    categoryPressItem = index;
    secondWord = word;
    emit(CategoryPress());
  }

  double subCategoriesMainBoxHight = 407.0;

  int? subcategoryPressItem;

  void subcategoryPress(bool x, int index) {
    subCategoriesMainBoxHight = x ? 626.0 : 407.0;
    subcategoryPressItem = x ? index : null;
    emit(SubCategoryPress());
  }

  Color? menPressBottomColor;
  Color? womenPressBottomColor;

  void menOrWomenPress(
    context, {
    required bool isMen,
  }) {
    if (isMen) {
      menPressBottomColor = black;
      womenPressBottomColor = Color(0xff939292);
      emit(MenCategoriesPress());
    } else {
      womenPressBottomColor = black;
      menPressBottomColor = Color(0xff939292);
      emit(WOMenCategoriesPress());
    }
  }
}
