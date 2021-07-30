import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/MyHelper.dart';
import '../../../models/CategorieModel.dart';
import '../../Themes/Colors.dart';
import '../../widgets/texts.dart';
import '../HomeScreen/HomePageWidgets.dart';
import '../HomeScreen/HomeScreen.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);
  static String routeName = '/AllCategoriesScreen' ;

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
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // shrinkWrap: true,
                  itemCount: categories.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return sb(h: 24.h);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    bool isPress = index % 2 == 1;
                    return Container(
                      height: 100.h,
                      width: 100.w,
                      child: buildCategoryItem(
                        context,
                        assetPathImage: categories[index].categorieSvgIcon,
                        categorieName: categories[index].categorieName,
                        isPress: isPress,
                        categoriePress: () {},
                      ),
                    );
                  },
                ),
              ),
              sb(w: 32.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButton(
                        child: Text(
                          "MEN’S APPAREL",
                          style: defaultTextStyle(context).copyWith(
                            color: black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      sb(w: 25.w),
                      TextButton(
                        child: Text(
                          "WOMEN APPAREL",
                          style: defaultTextStyle(context).copyWith(
                            color: Color(0xff939292),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    height: 400,
                    width: 240,
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
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: dividerColor!.withOpacity(0.5),
                          thickness: 3,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CircleAvatar(
                          backgroundColor: white,
                          radius: 10,
                        );
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
