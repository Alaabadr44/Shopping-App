import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Controller/Home/home_cubit.dart';
import '../../../helper/MyHelper.dart';
import '../../Themes/Colors.dart';
import '../Home/HomeScreen.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  static String routeName = '/ChatScreen';
  final TextEditingController massage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return WillPopScope(
          onWillPop: () async {
            goBack(context, _cubit);
            return true;
          },
          child: Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              centerTitle: true,
              titleSpacing: 60.w,
              leading: IconButton(
                onPressed: () => goBack(context, _cubit),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: black,
                ),
              ),
              title: ListTile(
                horizontalTitleGap: 10.w,
                // isThreeLine: true,

                leading: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: premiumColor,
                      boxShadow: [
                        BoxShadow(
                          color: secondaryColor!,
                          blurRadius: 5.r,
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    // ? ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
                    child: SvgPicture.asset(
                      "assets/Sico_svg.svg",
                      height: 21.h,
                      width: 17.w,
                    ),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 14.h),
                  child: Text(
                    "Shopping",
                    style: defaultTextStyle(context).copyWith(
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                subtitle: Text(
                  "Online",
                  style: defaultTextStyle(context).copyWith(
                    color: Color(0xff939292),
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                  ),
                ),
              ),
              backgroundColor: white,
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                ChatScreenDate(date: "Sun 21Apr,7:03PM."),
                SizedBox(height: 21.h),
                ChatScreenDivider(),
                SizedBox(height: 17.h),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ChatScreenBackGround(
                            constraints: constraints,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: 1,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(height: 15.h),
                              itemBuilder: (BuildContext context, int index) {
                                // return ChatScreenMassageFromMe(
                                //   massage:
                                //       "Nice to meet you. To start a chat just send a message to us.",
                                // );
                                // return ChatScreenMassageFromOther(
                                //   massage:
                                //       "Hi there, I need some info abc my order - ID#848939",
                                // );
                                return ChatScreenMassageTyping();
                              },
                            ),
                          ),
                          ChatScreenSendMassageField(
                            massageController: massage,
                            sendMassage: (_) {
                              print(_);
                            },
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void goBack(BuildContext context, HomeCubit _cubit) {
    navAndFinish(context: context, routeName: HomeScreen.routeName);
    _cubit.changePressBottomBarIcon(1, context);
  }
}

class ChatScreenBackGround extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget child;
  const ChatScreenBackGround({
    Key? key,
    required this.child,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight - 60.h,
      width: constraints.maxWidth,
      child: child,
    );
  }
}

class ChatScreenSendMassageField extends StatelessWidget {
  final TextEditingController massageController;
  final void Function(String?) sendMassage;
  const ChatScreenSendMassageField({
    Key? key,
    required this.massageController,
    required this.sendMassage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      child: TextField(
        controller: massageController,
        decoration: InputDecoration(
          hintText: "Type your message..",
          hintStyle: defaultTextStyle(context).copyWith(
            color: Color(0xff939292),
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
          ),
          fillColor: secondaryColor,
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.send_outlined,
              color: black,
            ),
            onPressed: () => sendMassage(massageController.text),
          ),
        ),
        onSubmitted: sendMassage,
      ),
    );
  }
}

class ChatScreenMassageTyping extends StatelessWidget {
  const ChatScreenMassageTyping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: 13.w,
        start: 300.w,
      ),
      child: Container(
          decoration: BoxDecoration(
            color: premiumColor,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20.r),
              topEnd: Radius.circular(20.r),
              bottomStart: Radius.circular(20.r),
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 5.r, backgroundColor: white),
              CircleAvatar(radius: 5.r, backgroundColor: white),
              CircleAvatar(radius: 5.r, backgroundColor: white),
            ],
          )),
    );

    // );
  }
}

class ChatScreenMassageFromOther extends StatelessWidget {
  final String massage;
  const ChatScreenMassageFromOther({
    Key? key,
    required this.massage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: 13.w,
        start: 150.w,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: premiumColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20.r),
            topEnd: Radius.circular(20.r),
            bottomStart: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 12.w),
        child: Text(
          massage,
          style: defaultTextStyle(context).copyWith(
            color: white,
            fontWeight: FontWeight.w500,
            fontSize: 17.sp,
          ),
          // textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ),
      ),
    );
  }
}

class ChatScreenMassageFromMe extends StatelessWidget {
  final String massage;
  const ChatScreenMassageFromMe({
    Key? key,
    required this.massage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 13.w,
        end: 150.w,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20.r),
            topEnd: Radius.circular(20.r),
            bottomEnd: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 12.w),
        child: Text(
          massage,
          style: defaultTextStyle(context).copyWith(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 17.sp,
          ),
          // textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ),
      ),
    );
  }
}

class ChatScreenDivider extends StatelessWidget {
  const ChatScreenDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(color: Color(0xffA1A1A1), thickness: 1);
  }
}

class ChatScreenDate extends StatelessWidget {
  final String date;
  const ChatScreenDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        date,
        style: defaultTextStyle(context).copyWith(
          color: Color(0xff939292),
          fontWeight: FontWeight.w500,
          fontSize: 17.sp,
        ),
      ),
    );
  }
}
