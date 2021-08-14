import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controller/Categoriescubit/categoriescubit_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../../models/CategorieModel.dart';
import '../../Themes/Colors.dart';
import '../Home/widgets/HomePageWidgets.dart';

class CategoriesItems extends StatelessWidget {
  final CategoriesCubit cubit;
  const CategoriesItems({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // shrinkWrap: true,
      itemCount: categories.length,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 24.h),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100.h,
          width: 100.w,
          child: BuildCategoryItem(
            assetPathImage: categories[index].categorieSvgIcon,
            categorieName: categories[index].categorieName,
            colorPress: index == cubit.categoryPressItem ? white : null,

            // if current index == now index   do that
            categoriePress: () {
              cubit.categoryPress(
                index,
                categories[index].categorieName,
              );
            },
          ),
        );
      },
    );
  }
}

class SubcategoriesItems extends StatelessWidget {
  final CategoriesCubit cubit;

  const SubcategoriesItems({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              categories[cubit.categoryPressItem ?? 0].subCategoryType![index],
              style: defaultTextStyle(context)
                  .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
            backgroundColor: white,
            trailing: BottomArrow(index: index, cubit: cubit),
            onExpansionChanged: (isExpansion) =>
                cubit.subcategoryPress(isExpansion, index),
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
}

class BottomArrow extends StatelessWidget {
  final int index;
  final CategoriesCubit cubit;
  const BottomArrow({
    Key? key,
    required this.index,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          index != cubit.subcategoryPressItem ? secondaryColor : black,
      radius: 15.r,
      child: Center(
        child: Transform.rotate(
          alignment: Alignment.center,
          angle: index != cubit.subcategoryPressItem ? (pi / -2) : (pi / 2),
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}

class MenOrWomenTextButton extends StatelessWidget {
  final void Function()? menPress;
  final Color? menPressColor;
  final void Function()? womenPress;
  final Color? womenPressColor;
  final String? secondWord;

  const MenOrWomenTextButton({
    Key? key,
    this.menPress,
    this.menPressColor,
    this.womenPress,
    this.womenPressColor,
    required this.secondWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        SizedBox(width: 25.w),
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
}
