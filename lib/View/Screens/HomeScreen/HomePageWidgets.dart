import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Controller/Home/home_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';

BlocBuilder<HomeCubit, HomeState> bottomNavigationBar() {
  return BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      HomeCubit _cubit = HomeCubit.get(context);
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: bottomIcon("assets/ICONS/1-bar.svg", _cubit.currentIndex, 1,
                labelStyle(context, _cubit.currentIndex == 0)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: bottomIcon("assets/ICONS/2-bar.svg", _cubit.currentIndex, 2,
                labelStyle(context, _cubit.currentIndex == 1)),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: bottomIcon("assets/ICONS/3-bar.svg", _cubit.currentIndex, 3,
                labelStyle(context, _cubit.currentIndex == 2)),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: bottomIcon("assets/ICONS/4-bar.svg", _cubit.currentIndex, 4,
                labelStyle(context, _cubit.currentIndex == 3)),
            label: "Account",
          ),
        ],
        currentIndex: _cubit.currentIndex,
        selectedLabelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: premiumColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
        unselectedLabelStyle: labelStyle(context, false),
        onTap: (x) => _cubit.changePressBottomBarIcon(x, context),
        selectedFontSize: 30.sp,
        unselectedFontSize: 15.sp,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 20,
        backgroundColor: white,
        selectedItemColor: premiumColor,
        type: BottomNavigationBarType.fixed,
      );
    },
  );
}

Widget bottomIcon(
  String asset,
  int currentIndex,
  int bottomIconIndex,
  TextStyle labelStyle,
) {
  bool isSelected = currentIndex == bottomIconIndex - 1;
  return SizedBox(
    height: 33.h,
    width: 33.w,
    child: Column(
      children: [
        SvgPicture.asset(
          asset,
          height: !isSelected ? 25.h : 33.h,
          width: !isSelected ? 25.w : 33.h,
          color: isSelected ? premiumColor : black,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

TextStyle labelStyle(
  BuildContext context,
  bool isSelected,
) {
  return Theme.of(context).textTheme.bodyText1!.copyWith(
        color: isSelected ? premiumColor : black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      );
}

Padding homeTopicText(
  BuildContext context,
  String topic,
  double w,
) {
  return Padding(
    padding: EdgeInsetsDirectional.only(start: w * 0.05),
    child: Text(
      topic,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600, color: black),
    ),
  );
}

Row homeTopicTextRaw(
  BuildContext context,
  double _width,
  String x, {
  void Function()? viewAllPress,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      homeTopicText(context, x, _width),
      Padding(
        padding: EdgeInsetsDirectional.only(end: _width * 0.05),
        child: TextButton(
          onPressed: viewAllPress ?? () {},
          child: Text(
            "View all",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: colorFromHex("939292"),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      )
    ],
  );
}

Card buildProductHomePageCard(
  double _width,
  BuildContext context, {
  String? networkSrcImage,
  String? assetPathImage,
  void Function()? favoritePress,
  Widget? favoritePressIcon,
  required String productName,
  String? currency,
  required String nowPrice,
  double? reviewStarsNumbers,
  TextDirection? priceDirection,
}) {
  return Card(
    elevation: 0,
    child: Container(
      width: 180.w,
      height: 270.h,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 160.h,
                width: 160.w,
                child: assetPathImage != null
                    ? Image.asset(
                        assetPathImage,
                        fit: BoxFit.fitHeight,
                      )
                    : Image.network(networkSrcImage!),
              ),
              IconButton(
                onPressed: favoritePress ?? () {},
                icon: favoritePressIcon ??
                    Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: premiumColor,
                    ),
              ),
            ],
          ),
          sb(h: 8.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: _width * 0.05),
            child: Text(
              productName,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
            ),
          ),
          sb(h: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: _width * 0.05),
                child: Text(
                  priceDirection == TextDirection.rtl
                      ? (currency ?? "\$") + (" ") + nowPrice
                      : nowPrice + (" ") + (currency ?? "\$"),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                      ),
                  // textDirection: priceDirection ?? TextDirection.ltr,
                ),
              ),
              if ((reviewStarsNumbers != null) &&
                  (reviewStarsNumbers <= 5 && reviewStarsNumbers >= 1))
                Container(
                  height: 25.h,
                  width: 56.25.w,
                  decoration: BoxDecoration(
                    color: premiumColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(Icons.star, size: 15, color: white),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          reviewStarsNumbers.toString().trim(),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    ),
  );
}

Card buildCategoryItem(
  BuildContext context, {
  required String assetPathImage,
  required String categorieName,
  void Function()? categoriePress,
  Color? colorPress,
}) {
  return Card(
    color: colorPress ?? secondaryColor,
    child: Container(
      height: 97.h,
      width: 90.w,
      alignment: Alignment.center,
      child: InkWell(
        onTap: categoriePress ?? () {},
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              assetPathImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: 50.h,
              width: 50.w,
              // color: premiumColor,
            ),

            // Icon(Icons.mail_outline),
            Text(
              categorieName,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: premiumColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}

Widget exclusiveProduct(
  BuildContext context, {
  String? networkSrcImage,
  String? assetPathImage,
  void Function()? favoritePress,
  Widget? favoritePressIcon,
  required String? nowPrice,
  String? oldPrice,
  String? currency,
  TextDirection? priceDirection,
  required String productName,
  double? reviewStarsNumbers,
  void Function()? addToCartPress,
  String? changeAddToCartTextButton,
}) {
  return Card(
    // elevation: 0,
    child: Container(
      width: 180.w,
      height: 270.h,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 160.h,
                width: 160.w,
                child: assetPathImage != null
                    ? Image.asset(assetPathImage)
                    : Image.network(networkSrcImage!),
              ),
              IconButton(
                onPressed: favoritePress ?? () {},
                icon: favoritePressIcon ??
                    Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: premiumColor,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (nowPrice != null)
                Text(
                  "${currency ?? '\$'}" + nowPrice,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                      ),
                  textDirection: priceDirection ?? TextDirection.ltr,
                ),
              if (oldPrice != null)
                Text(
                  "${currency ?? '\$'}" + oldPrice,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: premiumColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                      ),
                  // textDirection: TextDirection.ltr,
                  textDirection: priceDirection ?? TextDirection.ltr,
                ),
            ],
          ),
          sb(h: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: colorFromHex("939292"),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
              ),
              if ((reviewStarsNumbers != null) &&
                  (reviewStarsNumbers <= 5 && reviewStarsNumbers >= 1))
                Container(
                  height: 25.h,
                  width: 56.25.w,
                  decoration: BoxDecoration(
                    color: premiumColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(Icons.star, size: 15, color: white),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          reviewStarsNumbers.toString().trim(),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                )
            ],
          ),
          sb(h: 7.h),
          Container(
            width: 180.w,
            height: 37.h,
            child: ElevatedButton(
              onPressed: addToCartPress ?? () {},
              child: Text(
                changeAddToCartTextButton ?? 'Add To Cart',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(premiumColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Container buildBanaras(
  BuildContext context, {
  String? text,
  void Function()? seeMore,
  String? networkSrcImage,
  String? assetPathImage,
}) {
  return Container(
    height: 165.h,
    width: 375.w,
    decoration: BoxDecoration(
      color: premiumColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: white, fontWeight: FontWeight.w400, fontSize: 29.sp),
              // textWidthBasis: TextWidthBasis.parent,
              // maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
            sb(h: 9.h),
            Container(
              height: 38.h,
              width: 116.w,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: seeMore ?? () {},
                child: Text(
                  "See More",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: thirdColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsetsDirectional.only(start: 20),
          alignment: Alignment.bottomRight,
          child: networkSrcImage != null
              ? Image.network(
                  networkSrcImage,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  assetPathImage!,
                  fit: BoxFit.cover,
                ),
        )
      ],
    ),
  );
}

Widget countNotifications({
  required int count,
  BuildContext? context,
}) {
  bool showNum = true;
  if (count <= 0) {
    showNum = false;
  }
  return Stack(
    alignment: AlignmentDirectional.topEnd,
    children: [
      Icon(
        Icons.notifications_none_outlined,
        color: black,
        size: !showNum ? 35 : 30,
      ),
      Visibility(
        visible: showNum,
        child: Container(
          alignment: Alignment.center,
          height: 18.h,
          width: 18.w,
          decoration: BoxDecoration(shape: BoxShape.circle, color: thirdColor),
          child: Text(
            count.toString(),
            style: Theme.of(context!).textTheme.bodyText1!.copyWith(
                  color: white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      )
    ],
  );
}

AppBar homeAppBarScreen(
  BuildContext context,
  int notificationsCount, {
  Function()? searchPress,
  Function()? notificationsPress,
  double? elevation,
  bool isThereBack = false,
  Function()? backPress,
}) {
  return AppBar(
    elevation: elevation,
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isThereBack)
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: black,
                size: 30,
              ),
              onPressed: backPress ?? () {},
            ),
          ),
        if (isThereBack) sb(w: 26.w),
        Expanded(
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: black,
              size: 30,
            ),
            onPressed: searchPress ?? () {},
          ),
        ),
      ],
    ),
    backgroundColor: white,
    actions: [
      IconButton(
        icon: countNotifications(context: context, count: notificationsCount),
        onPressed: notificationsPress ?? () {},
      ),
    ],
  );
}
