import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../helper/MyHelper.dart';
import '../../../Themes/Colors.dart';
import '../../../widgets/texts.dart';
import '../HomeScreen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static String routeName = "/NotificationsScreen";

  @override
  Widget build(BuildContext context) {
    bool isNew = true;
    bool isThereNotificationNewUnRead = false;
    bool isEarlier = true;
    bool isThereNotificationEarlierUnRead = false;
    return Scaffold(
      appBar: notificationsScreenAppBar(
        closePress: () =>
            navAndFinish(context: context, routeName: HomeScreen.routeName),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            MainBigTopic(topic: "notifications"),
            SizedBox(height: 24.h),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isNew)
                    NotificationsScreenSubTopic(
                      subTopic: "New",
                      conditionViewNum: isThereNotificationNewUnRead,
                      numberNotifications: 5,
                    ),
                  SizedBox(height: 25.h),
                  /*
                  
                مطلوب تحديد الارتفاع بتاع الكونتينر على حسب عدد العناصر
      
                  *! h = (x *20.h ) +(x* 95.h)  
                   */
                  if (isNew)
                    Container(
                      height: ((2 * 20.h) + (2 * 95.h)), //? ___ 2____
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2, //? ___ 2____
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 20.h);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          bool viewRead = index == 0 ? true : false;
                          return NotificationsModelView(
                            isReading: viewRead,
                            notificationsTime: "935 AM",
                            notificationsText:
                                " 50% OFF  in Ultrashort AllTerrain  Ltd Shoes!!  ",
                            // notificationsSpecialWord: "AllTerrain",
                            notificationsSenderPhotoUrl:
                                "https://pbs.twimg.com/profile_images/1416573352358162446/vQPbSf9Z_400x400.jpg",
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 20.h),
                  if (isEarlier)
                    NotificationsScreenSubTopic(
                      subTopic: "Earlier",
                      conditionViewNum: isThereNotificationEarlierUnRead,
                      numberNotifications: 5,
                    ),
                  if (isEarlier)
                    Container(
                      height: ((15 * 20.h) + (15 * 95.h)), //? ___ 15____
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 15, //? ___ 15____
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 20.h);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          bool viewRead = index == 0 ? true : false;
                          return NotificationsModelView(
                            isReading: viewRead,
                            notificationsTime: "935 AM",
                            notificationsText:
                                " 50% OFF  in Ultrashort AllTerrain  Ltd Shoes!!  ",
                            notificationsSpecialWord: "50% OFF",
                            notificationsSenderPhotoUrl:
                                "https://pbs.twimg.com/profile_images/1416573352358162446/vQPbSf9Z_400x400.jpg",
                          );
                        },
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationsScreenSubTopic extends StatelessWidget {
  final String subTopic;
  final int? numberNotifications;
  final bool conditionViewNum;
  const NotificationsScreenSubTopic({
    Key? key,
    required this.subTopic,
    this.numberNotifications,
    required this.conditionViewNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: _width * 0.05),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$subTopic",
            style: defaultTextStyle(context).copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10.w),
          if (conditionViewNum == true)
            Container(
              height: 15.h,
              width: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: premiumColor,
                shape: BoxShape.circle,
              ),
              child: numberNotifications != null
                  ? Text(
                      "$numberNotifications",
                      style: defaultTextStyle(context).copyWith(
                          color: white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    )
                  : SizedBox(),
            )
        ],
      ),
    );
  }
}

AppBar notificationsScreenAppBar({
  void Function()? searchPress,
  void Function()? closePress,
}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.search,
        color: black,
        size: 35,
      ),
      onPressed: searchPress ?? () {},
    ),
    backgroundColor: white,
    actions: [
      IconButton(
        icon: Icon(
          Icons.close,
          color: black,
          size: 35,
        ),
        onPressed: closePress ?? () {},
      ),
    ],
  );
}

class NotificationsModelView extends StatelessWidget {
  final bool isReading;
  final String notificationsTime;
  final String notificationsText;
  final String? notificationsSpecialWord;
  final String? notificationsSender;
  final String? notificationsSenderPhoto;
  final String? notificationsSenderPhotoUrl;
  final void Function()? notificationsPress;

  const NotificationsModelView({
    Key? key,
    required this.isReading,
    required this.notificationsTime,
    required this.notificationsText,
    this.notificationsSender,
    this.notificationsSenderPhoto,
    this.notificationsSenderPhotoUrl,
    this.notificationsPress,
    this.notificationsSpecialWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    wordOfLine specialWordInLinePosition = wordOfLine.none;
    ResultOfSplitLineToPartsByWord? result;
    if (notificationsSpecialWord != null) {
      specialWordInLinePosition = whereWordInLine(
        lineOfWords: notificationsText,
        word: notificationsSpecialWord!,
      );

      result = splitLineToPartsByWord(
        lineOfWords: notificationsText,
        word: notificationsSpecialWord!,
        wordPositionInLine: specialWordInLinePosition,
      );
    }
    double _width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      height: 95.h,
      width: _width,
      color: isReading ? white : secondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
        child: ListTile(
          onTap: notificationsPress ?? () {},
          // title: Text(
          //   notificationsSender,
          //   style: defaultTextStyle(context).copyWith(
          //     color: black,
          //     fontSize: 20.sp,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          leading: Container(
            alignment: Alignment.center,
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: thirdColor,
              shape: BoxShape.circle,
              image: notificationsSenderPhotoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(
                        notificationsSenderPhotoUrl!,
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: notificationsSenderPhoto != null
                ? SvgPicture.asset(
                    notificationsSenderPhoto!,
                    height: 40.h,
                    width: 40.w,
                  )
                : null,
          ),

          subtitle: specialWordInLinePosition == wordOfLine.none
              ? Text(
                  notificationsText,
                  style: defaultTextStyle(context).copyWith(
                    color: black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : specialWordInLinePosition == wordOfLine.start
                  ? RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: defaultTextStyle(context).copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: "$notificationsSpecialWord",
                            style: TextStyle(
                              color: premiumColor,
                            ),
                          ),
                          TextSpan(
                            text: "${result!.secondPart}",
                            style: TextStyle(
                              color: Color(0xff4A4A4A),
                            ),
                          ),
                        ],
                      ),
                    )
                  : specialWordInLinePosition == wordOfLine.middle
                      ? RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: defaultTextStyle(context).copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "${result!.firstPart}",
                                style: TextStyle(
                                  color: Color(0xff4A4A4A),
                                ),
                              ),
                              TextSpan(
                                text: "${result.word}",
                                style: TextStyle(
                                  color: premiumColor,
                                ),
                              ),
                              TextSpan(
                                text: "${result.secondPart}",
                                style: TextStyle(
                                  color: Color(0xff4A4A4A),
                                ),
                              ),
                            ],
                          ),
                        )
                      : RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: defaultTextStyle(context).copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "${result!.firstPart}",
                                style: TextStyle(
                                  color: Color(0xff4A4A4A),
                                ),
                              ),
                              TextSpan(
                                text: "$notificationsSpecialWord",
                                style: TextStyle(
                                  color: premiumColor,
                                ),
                              ),
                            ],
                          ),
                        ),

          trailing: SizedBox(
            height: 27,
            width: 63,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      notificationsTime,
                      style: defaultTextStyle(context).copyWith(
                        color: Color(0xff939292),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 5.h),
                if (!isReading)
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: thirdColor,
                      shape: BoxShape.circle,
                    ),
                  )
              ],
            ),
          ),
          // tileColor: dividerColor,
        ),
      ),
    );
  }
}
