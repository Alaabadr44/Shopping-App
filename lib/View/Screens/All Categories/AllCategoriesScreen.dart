import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controller/Categoriescubit/categoriescubit_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../../models/CategorieModel.dart';
import '../../Themes/Colors.dart';
import '../../widgets/texts.dart';
import '../Home/HomeScreen.dart';
import '../Home/widgets/HomePageWidgets.dart';

// ignore: must_be_immutable
class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({Key? key}) : super(key: key);
  static String routeName = '/AllCategoriesScreen';

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: homeAppBarScreen(
        context,
        3,
        isThereBack: true,
        backPress: () =>
            navAndFinish(context: context, routeName: HomeScreen.routeName),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sb(h: 23.h),
          mainBigTopic(_width, context, "All Categories"),
          sb(h: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: _width * 0.05),
                height: 680.h,
                width: 120.w,
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    CategoriesCubit _cubit = CategoriesCubit.get(context);
                    return categoriesItems(_cubit);
                  },
                ),
              ),
              sb(w: 32.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      CategoriesCubit _cubit = CategoriesCubit.get(context);
                      return menOrWomenTextButton(
                        context,
                        secondWord: _cubit.secondWord ?? "Apparel",
                        menPress: () {
                          _cubit.menOrWomenPress(context, isMen: true);
                        },
                        menPressColor: _cubit.menPressBottomColor,
                        womenPress: () {
                          _cubit.menOrWomenPress(context, isMen: false);
                        },
                        womenPressColor: _cubit.womenPressBottomColor,
                      );
                    },
                  ),
                  BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      CategoriesCubit _cubit = CategoriesCubit.get(context);
                      return Container(
                        height: _cubit.subCategoriesMainBoxHight.h,
                        width: 240.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffF3D6FF).withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: subcategoriesItems(_cubit),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

ListView categoriesItems(CategoriesCubit _cubit) {
  return ListView.separated(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    // shrinkWrap: true,
    itemCount: categories.length,
    separatorBuilder: (BuildContext context, int index) => sb(h: 24.h),
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 100.h,
        width: 100.w,
        child: buildCategoryItem(
          context,
          assetPathImage: categories[index].categorieSvgIcon,
          categorieName: categories[index].categorieName,
          colorPress: index == _cubit.categoryPressItem ? white : null,
          categoriePress: () {
            _cubit.categoryPress(index, categories[index].categorieName);
          },
        ),
      );
    },
  );
}

ListView subcategoriesItems(CategoriesCubit _cubit) {
  return ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: categories.length,
    separatorBuilder: (BuildContext context, int index) => Divider(
      color: dividerColor!.withOpacity(0.5),
      thickness: 3,
    ),
    itemBuilder: (BuildContext context, int index) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: false,
          title: Text(
            categories[_cubit.categoryPressItem ?? 0].subCategoryType![index],
            style: defaultTextStyle(context)
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          backgroundColor: white,
          trailing: bottomArrow(index, _cubit),
          onExpansionChanged: (isExpansion) =>
              _cubit.subcategoryPress(isExpansion, index),
          children: [
            Container(
              height: 193.h,
              width: 240.w,
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    height: 49,
                    width: 40,
                    color: black,
                  ),
                  Container(
                    height: 49,
                    width: 40,
                    color: black,
                  ),
                  Container(
                    height: 49,
                    width: 40,
                    color: black,
                  ),
                  Container(
                    height: 49,
                    width: 40,
                    color: black,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

CircleAvatar bottomArrow(int index, CategoriesCubit _cubit) {
  return CircleAvatar(
    backgroundColor:
        index != _cubit.subcategoryPressItem ? secondaryColor : black,
    radius: 15.r,
    child: Center(
      child: Transform.rotate(
        alignment: Alignment.center,
        angle: index != _cubit.subcategoryPressItem ? (pi / -2) : (pi / 2),
        child: Icon(
          Icons.arrow_back_ios,
          color: white,
          size: 20.sp,
        ),
      ),
    ),
  );
}

Row menOrWomenTextButton(
  BuildContext context, {
  void Function()? menPress,
  Color? menPressColor,
  void Function()? womenPress,
  Color? womenPressColor,
  required String? secondWord,
}) {
  return Row(
    children: [
      TextButton(
        child: Text(
          "MEN’S " + (secondWord ?? ""),
          style: defaultTextStyle(context).copyWith(
            color: menPressColor ?? Color(0xff939292),
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: menPress ?? () {},
      ),
      sb(w: 25.w),
      TextButton(
        child: Text(
          "WOMEN " + (secondWord ?? ""),
          style: defaultTextStyle(context).copyWith(
            color: womenPressColor ?? Color(0xff939292),
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: womenPress ?? () {},
      ),
    ],
  );
}
