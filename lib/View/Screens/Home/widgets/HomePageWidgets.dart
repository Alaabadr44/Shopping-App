import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Controller/Home/home_cubit.dart';
import '../../../../../helper/MyHelper.dart';
import '../../../Themes/Colors.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: BottomIcon(
                asset: "assets/ICONS/1-bar.svg",
                currentIndex: _cubit.currentIndex,
                bottomIconIndex: 1,
                labelStyle: labelStyle(context, _cubit.currentIndex == 0),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: BottomIcon(
                asset: "assets/ICONS/2-bar.svg",
                currentIndex: _cubit.currentIndex,
                bottomIconIndex: 2,
                labelStyle: labelStyle(context, _cubit.currentIndex == 1),
              ),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: BottomIcon(
                asset: "assets/ICONS/3-bar.svg",
                currentIndex: _cubit.currentIndex,
                bottomIconIndex: 3,
                labelStyle: labelStyle(context, _cubit.currentIndex == 2),
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: BottomIcon(
                asset: "assets/ICONS/4-bar.svg",
                currentIndex: _cubit.currentIndex,
                bottomIconIndex: 4,
                labelStyle: labelStyle(context, _cubit.currentIndex == 3),
              ),
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
}

class BottomIcon extends StatelessWidget {
  final String asset;
  final int currentIndex;
  final int bottomIconIndex;
  final TextStyle labelStyle;

  const BottomIcon({
    Key? key,
    required this.asset,
    required this.currentIndex,
    required this.bottomIconIndex,
    required this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class HomeTopicText extends StatelessWidget {
  final String topic;
  const HomeTopicText({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: w * 0.05),
      child: Text(
        topic,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 20.sp, fontWeight: FontWeight.w600, color: black),
      ),
    );
  }
}

class HomeTopicTextRaw extends StatelessWidget {
  final String topic;
  final void Function()? viewAllPress;
  const HomeTopicTextRaw({
    Key? key,
    required this.topic,
    required this.viewAllPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeTopicText(topic: topic),
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
}

// Card buildProductHomePageCard(
//   double _width,
//   BuildContext context, {
//   String? networkSrcImage,
//   String? assetPathImage,
//   void Function()? favoritePress,
//   Widget? favoritePressIcon,
//   required String productName,
//   String? currency,
//   required String nowPrice,
//   double? reviewStarsNumbers,
//   TextDirection? priceDirection,
// }) {
//   return BuildProductHomePageCard();
// }

// ignore: must_be_immutable
class BuildProductHomePageCard extends StatelessWidget {
  // nowPrice: "35",
  //productName: "digital clock",
  //assetPathImage: "assets/DUMMY/download 1.png",
  //priceDirection: TextDirection.rtl,
  //reviewStarsNumbers: 1,

  final String? networkSrcImage;
  final String? assetPathImage;
  void Function()? favoritePress;
  Widget? favoritePressIcon;
  final String productName;
  final String? currency;
  final String nowPrice;
  double? reviewStarsNumbers;
  TextDirection? priceDirection;

  BuildProductHomePageCard({
    Key? key,
    this.networkSrcImage,
    this.assetPathImage,
    this.favoritePress,
    this.favoritePressIcon,
    required this.productName,
    this.currency,
    required this.nowPrice,
    this.reviewStarsNumbers,
    this.priceDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                          assetPathImage!,
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
            SizedBox(height: 8.h),
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
            SizedBox(height: 7.h),
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
                    (reviewStarsNumbers! <= 5 && reviewStarsNumbers! >= 1))
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
}



class BuildCategoryItem extends StatelessWidget {
  final String assetPathImage;
  final String categorieName;
  final void Function()? categoriePress;
  final Color? colorPress;

  const BuildCategoryItem({
    Key? key,
    required this.assetPathImage,
    required this.categorieName,
    this.categoriePress,
    this.colorPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class ExclusiveProduct extends StatelessWidget {
  final String? networkSrcImage;
  final String? assetPathImage;
  final void Function()? favoritePress;
  final Widget? favoritePressIcon;
  final String nowPrice;
  final String? oldPrice;
  final String? currency;
  final TextDirection? priceDirection;
  final String productName;
  final double? reviewStarsNumbers;
  final void Function() addToCartPress;
  final String? changeAddToCartTextButton;

  const ExclusiveProduct({
    Key? key,
    this.networkSrcImage,
    this.assetPathImage,
    this.favoritePress,
    this.favoritePressIcon,
    required this.nowPrice,
    this.oldPrice,
    this.currency,
    this.priceDirection,
    required this.productName,
    this.reviewStarsNumbers,
    required this.addToCartPress,
    this.changeAddToCartTextButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      ? Image.asset(assetPathImage!)
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
                    "${currency ?? '\$'}" + oldPrice!,
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
            SizedBox(height: 8.h),
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
                    (reviewStarsNumbers! <= 5 && reviewStarsNumbers! >= 1))
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
            SizedBox(height: 7.h),
            Container(
              width: 180.w,
              height: 37.h,
              child: ElevatedButton(
                onPressed: addToCartPress,
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
}

class BuildBanaras extends StatelessWidget {
  final String? text;
  final void Function()? seeMore;
  final String? networkSrcImage;
  final String? assetPathImage;
  const BuildBanaras({
    Key? key,
    required this.text,
    required this.seeMore,
    this.networkSrcImage,
    this.assetPathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 9.h),
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
                    networkSrcImage!,
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
}

class CountNotifications extends StatelessWidget {
  final int count;

  const CountNotifications({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: thirdColor),
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
        if (isThereBack) SizedBox(width: 26.w),
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
        icon: CountNotifications(count: notificationsCount),
        onPressed: notificationsPress ?? () {},
      ),
    ],
  );
}
