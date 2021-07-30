import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/MyHelper.dart';
import '../../../../models/CategorieModel.dart';
import '../../../Themes/Colors.dart';
import '../../All%20Categories/AllCategoriesScreen.dart';
import '../HomePageWidgets.dart';

class HomeForHomeScreen extends StatelessWidget {
  const HomeForHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sb(h: 12.h),
          homeTopicText(context, 'New arrival', _width),
          sb(h: 10.h),
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, __, _) {
              return buildBanaras(context,
                  text: " Super Flash Sale \n" + "\t 50% Off",
                  assetPathImage:
                      'assets/DUMMY/2021_Clifton_website_header2 2.png');
            },
            options: CarouselOptions(
              height: 165.h,
              enlargeCenterPage: true,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 0.8,
              // pageSnapping: false,
            ),
          ),
          sb(h: 8.h),
          Divider(color: dividerColor, thickness: 10),
          // sb(h: 12.h),
          homeTopicTextRaw(context, _width, "Exclusive deals"),
          Container(
            height: 240,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return sb(w: 20.w);
              },
              itemBuilder: (BuildContext context, int index) {
                return exclusiveProduct(
                  context,
                  assetPathImage: "assets/DUMMY/download 1.png",
                  productName: "digital clock",
                  nowPrice: '35',
                  oldPrice: '70',
                  // addToCartPress: () {},
                  reviewStarsNumbers: 5,
                );
              },
            ),
          ),
          sb(h: 3.h),
          Divider(color: dividerColor, thickness: 10),
          homeTopicTextRaw(
            context,
            _width,
            "Categories",
            viewAllPress: () =>
                nav(context: context, routeName: AllCategoriesScreen.routeName),
          ),
          Container(
            height: 100.h,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (BuildContext context, int index) {
                return sb(w: 10.w);
              },
              itemBuilder: (BuildContext context, int index) {
                return buildCategoryItem(
                  context,
                  assetPathImage: categories[index].categorieSvgIcon,
                  categorieName: categories[index].categorieName,
                );
              },
            ),
          ),
          sb(h: 15.h),
          Divider(color: dividerColor, thickness: 10),
          homeTopicTextRaw(context, _width, "Products"),
          sb(h: 15.h),
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
              return buildProductHomePageCard(
                _width,
                context,
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
