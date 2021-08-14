import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../helper/MyHelper.dart';
import '../../../Themes/Colors.dart';
import '../../ChatScreen/ChatScreen.dart';

class MessagesForHomeScreen extends StatelessWidget {
  const MessagesForHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          MessagesTopic(topic: "Messages"),
          SizedBox(height: 24.h),
          MassagesBackGround(
            child: ListView.separated(
              // shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 15,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (BuildContext context, int index) {
                bool tryRead = false;
                tryRead = index == 0 || index == 1 ? false : true;
                // if ((index) % 2 == 0) {
                // }
                return MassageModelView(
                  massageSender: "Alaa badr",
                  massageText: "50% OFF in Ultrashort AllTerrain Ltd Shoes!!",
                  massageTime: "10;20 AM",
                  isReading: tryRead,
                  // massageSenderPhoto: "assets/ico_svg.svg",
                  massagePress: () =>
                      nav(context: context, routeName: ChatScreen.routeName),
                  massageSenderPhotoUrl:
                      "https://pbs.twimg.com/profile_images/1416573352358162446/vQPbSf9Z_400x400.jpg",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MassagesBackGround extends StatelessWidget {
  final Widget child;
  const MassagesBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 800.h,
      child: child,
    );
  }
}

class MessagesTopic extends StatelessWidget {
  final String topic;
  const MessagesTopic({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: _width * 0.05),
      child: Text(
        topic,
        style: defaultTextStyle(context).copyWith(
          color: black,
          fontSize: 35.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class MassageModelView extends StatelessWidget {
  final bool isReading;
  final String massageTime;
  final String massageText;
  final String massageSender;
  final String? massageSenderPhoto;
  final String? massageSenderPhotoUrl;
  final void Function()? massagePress;
  const MassageModelView({
    Key? key,
    required this.isReading,
    required this.massageTime,
    required this.massageText,
    required this.massageSender,
    this.massageSenderPhoto,
    this.massageSenderPhotoUrl,
    this.massagePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    var fc = massageSender.split(" ")[0].characters.first.toUpperCase();
    var sc = massageSender.split(" ")[1].characters.first.toUpperCase();
    return Container(
      alignment: Alignment.center,
      height: 95.h,
      width: _width,
      color: isReading ? white : secondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
        child: ListTile(
          onTap: massagePress ?? () {},
          title: Text(
            massageSender,
            style: defaultTextStyle(context).copyWith(
              color: black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Container(
            alignment: Alignment.center,
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: thirdColor,
              shape: BoxShape.circle,
              image: massageSenderPhotoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(massageSenderPhotoUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: massageSenderPhotoUrl == null
                ? massageSenderPhoto != null
                    ? SvgPicture.asset(
                        massageSenderPhoto!,
                        height: 40.h,
                        width: 40.w,
                      )
                    : Text(
                        fc + " " + sc,
                        style: defaultTextStyle(context).copyWith(
                          color: white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 5,
                        ),
                        maxLines: 1,
                        textWidthBasis: TextWidthBasis.parent,
                        overflow: TextOverflow.ellipsis,
                      )
                : null,
          ),
          subtitle: Text(
            massageText,
            style: defaultTextStyle(context).copyWith(
              color: black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
            textWidthBasis: TextWidthBasis.parent,
            softWrap: true,
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
                      massageTime,
                      style: defaultTextStyle(context).copyWith(
                        color: Color(0xff939292),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // sb(h: 5.h),
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
