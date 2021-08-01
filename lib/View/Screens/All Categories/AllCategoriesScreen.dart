import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controller/Categoriescubit/categoriescubit_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../../models/CategorieModel.dart';
import '../../Themes/Colors.dart';
import '../../widgets/texts.dart';
import '../HomeScreen/HomePageWidgets.dart';
import '../HomeScreen/HomeScreen.dart';

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
                      );
                    },
                  ),
                  Container(
                    height: 407.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffF3D6FF).withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, state) {
                        CategoriesCubit _cubit = CategoriesCubit.get(context);
                        return subcategoriesItems(_cubit);
                      },
                    ),
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
    separatorBuilder: (BuildContext context, int index) {
      return sb(h: 24.h);
    },
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
    itemCount: categories.length,
    separatorBuilder: (BuildContext context, int index) {
      return Divider(
        color: dividerColor!.withOpacity(0.5),
        thickness: 3,
      );
    },
    itemBuilder: (BuildContext context, int index) {
      return Container(
        width: 240.w,
        height: 67.h,
        child: ExpansionTile(
          title: Text(
            categories[_cubit.categoryPressItem ?? 0].subCategoryType![index],
            style: defaultTextStyle(context)
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          backgroundColor: white,
          trailing: bottomArrow(),
        ),
      );
    },
  );
}

CircleAvatar bottomArrow() {
  return CircleAvatar(
    backgroundColor: secondaryColor,
    radius: 15.r,
    child: Center(
      child: Transform.rotate(
        alignment: Alignment.center,
        angle: (pi / -2),
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
  void Function()? womenPress,
  required String? secondWord,
}) {
  return Row(
    children: [
      TextButton(
        child: Text(
          "MEN’S " + (secondWord ?? ""),
          style: defaultTextStyle(context).copyWith(
            color: black,
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
            color: Color(0xff939292),
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: womenPress ?? () {},
      ),
    ],
  );
}
