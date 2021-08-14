import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controller/Categoriescubit/categoriescubit_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../widgets/texts.dart';
import '../Home/HomeScreen.dart';
import '../Home/widgets/HomePageWidgets.dart';
import 'body.dart';

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
          SizedBox(height: 23.h),
          MainBigTopic(topic: "All Categories"),
          SizedBox(height: 15.h),
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
                    return CategoriesItems(cubit: _cubit);
                  },
                ),
              ),
              SizedBox(width: 32.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      CategoriesCubit _cubit = CategoriesCubit.get(context);
                      return MenOrWomenTextButton(
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
                          child: SubcategoriesItems(cubit: _cubit),
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
