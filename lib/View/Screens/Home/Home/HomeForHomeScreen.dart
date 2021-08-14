import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/MyHelper.dart';
import '../../../../models/CategorieModel.dart';
import '../../../Themes/Colors.dart';
import '../../All%20Categories/AllCategoriesScreen.dart';
import '../widgets/HomePageWidgets.dart';

class HomeForHomeScreen extends StatelessWidget {
  const HomeForHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeForHomePageBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          HomeTopicText(topic: 'New arrival'),
          SizedBox(height: 10.h),
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, __, _) {
              return BuildBanaras(
                text: " Super Flash Sale \n" + "\t 50% Off",
                assetPathImage:
                    'assets/DUMMY/2021_Clifton_website_header2 2.png',
                seeMore: () {},
              );
            },
            options: CarouselOptions(
              height: 165.h,
              enlargeCenterPage: true,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 0.8,
              // pageSnapping: false,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: dividerColor, thickness: 10),
          //SizedBox(height:12.h),
          HomeTopicTextRaw(topic: "Exclusive deals", viewAllPress: () {}),
          Container(
            height: 240,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 20.w);
              },
              itemBuilder: (BuildContext context, int index) {
                return ExclusiveProduct(
                  assetPathImage: "assets/DUMMY/download 1.png",
                  productName: "digital clock",
                  nowPrice: '35',
                  oldPrice: '70',
                  addToCartPress: () {},
                  reviewStarsNumbers: 5,
                );
              },
            ),
          ),
          SizedBox(height: 3.h),
          Divider(color: dividerColor, thickness: 10),
          HomeTopicTextRaw(
            topic: "Categories",
            viewAllPress: () => nav(
              context: context,
              routeName: AllCategoriesScreen.routeName,
            ),
          ),
          Container(
            height: 100.h,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10.w);
              },
              itemBuilder: (BuildContext context, int index) {
                return BuildCategoryItem(
                  assetPathImage: categories[index].categorieSvgIcon,
                  categorieName: categories[index].categorieName,
                );
              },
            ),
          ),
          SizedBox(height: 15.h),
          Divider(color: dividerColor, thickness: 10),
          HomeTopicTextRaw(topic: "Products", viewAllPress: () {}),
          SizedBox(height: 15.h),
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 2,
              mainAxisExtent: 220,
              mainAxisSpacing: 0.5,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, _) {
              return BuildProductHomePageCard(
                // currency: "ر.ع",
                nowPrice: "35",
                productName: "digital clock",
                assetPathImage: "assets/DUMMY/download 1.png",
                priceDirection: TextDirection.rtl,
                reviewStarsNumbers: 1,
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeForHomePageBody extends StatelessWidget {
  final Widget child;
  const HomeForHomePageBody({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: child,
    );
  }
}
