import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
}
