import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/MyHelper.dart';
import '../../../../models/AccountOptionsModel.dart';
import '../../../Themes/Colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  final String assetPathBody = 'assets/SignScreenbg.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetPathBody),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h),
          AccountScreenTopic(),
          SizedBox(height: 10.h),
          AccountInformationListTile(
            accountEmail: "‘marthafuller@mailcom",
            editPress: () {},
            username: "Christine Ortiz",
            accountPhotoUrl:
                "https://i.pinimg.com/474x/5f/5c/b0/5f5cb06dac3c26f51dd981720a2aad6e.jpg",
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                AccountScreenSecondBackGround(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListOptions(
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return DividerInOptionsList();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return AccountOptionButton(
                            optionIcon: homeOptions[index].homeOptionIcon,
                            optionText: homeOptions[index].homeOptionText,
                            isLanguageOption: index == 4,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25.h),
                    ListOptions(
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return DividerInOptionsList();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          index = index + 5;
                          return AccountOptionButton(
                            optionIcon: homeOptions[index].homeOptionIcon,
                            optionText: homeOptions[index].homeOptionText,
                            isLanguageOption: index == 4,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25.h),
                    LogOut(logOutPress: () {}),
                    SizedBox(height: 7.h),
                    Version(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountScreenSecondBackGround extends StatelessWidget {
  const AccountScreenSecondBackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(150),
            ),
          ),
        );
      },
    );
  }
}

class DividerInOptionsList extends StatelessWidget {
  const DividerInOptionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Color(0xffC4C4C4),
        thickness: 1,
        height: 5.h,
      ),
    );
  }
}

class ListOptions extends StatelessWidget {
  final Widget child;
  const ListOptions({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 17),
        height: 230.h,
        width: 380.w,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: child);
  }
}

class Version extends StatelessWidget {
  const Version({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "v01-003",
        style: defaultTextStyle(context).copyWith(
          color: Color(0xff979797),
          fontWeight: FontWeight.w500,
          fontSize: 17.sp,
        ),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  final void Function()? logOutPress;
  final String? logOutWord;
  const LogOut({
    Key? key,
    required this.logOutPress,
    this.logOutWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: logOutPress ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout,
              size: 18,
              color: black,
            ),
            SizedBox(width: 10.w),
            Text(
              logOutWord ?? "Log out",
              style: defaultTextStyle(context).copyWith(
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountOptionButton extends StatelessWidget {
  final String optionText;
  final IconData optionIcon;
  final void Function()? onOptionTap;
  final bool isLanguageOption;
  final String? language;

  const AccountOptionButton({
    Key? key,
    required this.optionText,
    required this.optionIcon,
    this.onOptionTap,
    required this.isLanguageOption,
    this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOptionTap ?? null,
      child: Container(
        height: 40.h,
        width: 380.w,
        child: Row(
          children: [
            SizedBox(width: 22.w),
            Icon(
              optionIcon,
              size: 30,
              color: premiumColor,
            ),
            SizedBox(width: 10.w),
            Text(
              optionText,
              style: defaultTextStyle(context).copyWith(
                color: black,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
              ),
            ),
            if (isLanguageOption) Spacer(),
            if (isLanguageOption)
              Padding(
                padding: EdgeInsetsDirectional.only(end: 34.w),
                child: Text(
                  language ?? "English",
                  style: defaultTextStyle(context).copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: black,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class AccountInformationListTile extends StatelessWidget {
  final String username;
  final String? accountPhotoUrl;
  final String accountEmail;
  final void Function()? editPress;

  const AccountInformationListTile({
    Key? key,
    required this.username,
    this.accountPhotoUrl,
    required this.accountEmail,
    required this.editPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        username,
        style: defaultTextStyle(context).copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
      leading: CircleAvatar(
        radius: 50.r,
        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                accountPhotoUrl ?? "",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
      contentPadding: EdgeInsetsDirectional.only(start: 2),
      minLeadingWidth: 50.w,
      subtitle: Text(
        accountEmail,
        style: defaultTextStyle(context).copyWith(
          color: white,
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Padding(
        padding: EdgeInsetsDirectional.only(end: 20.w),
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor: secondaryColor,
          child: IconButton(
            icon: Icon(
              Icons.edit,
              size: 20,
              color: premiumColor,
            ),
            onPressed: editPress,
          ),
        ),
      ),
      horizontalTitleGap: 3.w,
      minVerticalPadding: 10.h,
    );
  }
}

class AccountScreenTopic extends StatelessWidget {
  const AccountScreenTopic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 11.w),
      child: Text(
        "Account",
        style: defaultTextStyle(context).copyWith(
          color: white,
          fontSize: 35.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
