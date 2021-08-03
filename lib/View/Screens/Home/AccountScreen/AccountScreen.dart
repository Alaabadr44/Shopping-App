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
          sb(h: 30.h),
          accountScreenTopic(context),
          sb(h: 10.h),
          accountInformationListTile(
            context,
            accountEmail: "‘marthafuller@mailcom",
            editPress: () {},
            username: "Christine Ortiz",
            accountPhotoUrl:
                "https://i.pinimg.com/474x/5f/5c/b0/5f5cb06dac3c26f51dd981720a2aad6e.jpg",
          ),
          sb(h: 10.h),
          Stack(
            children: [
              secondBackGround(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  listOptions(
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index) {
                        return dividerInOptionsList();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return accountOptionButton(
                          context,
                          optionIcon: homeOptions[index].homeOptionIcon,
                          optionText: homeOptions[index].homeOptionText,
                          isLanguageOption: index == 4,
                        );
                      },
                    ),
                  ),
                  sb(h: 25.h),
                  listOptions(
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index) {
                        return dividerInOptionsList();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        index = index + 5;
                        return accountOptionButton(
                          context,
                          optionIcon: homeOptions[index].homeOptionIcon,
                          optionText: homeOptions[index].homeOptionText,
                          isLanguageOption: index == 4,
                        );
                      },
                    ),
                  ),
                  sb(h: 25.h),
                  logOut(context, logOutPress: () {}),
                  sb(h: 7.h),
                  version(context),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Container secondBackGround() {
  return Container(
    height: 585.4.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(150),
        topRight: Radius.circular(150),
      ),
    ),
  );
}

Padding dividerInOptionsList() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Divider(
      color: Color(0xffC4C4C4),
      thickness: 1,
      height: 5.h,
    ),
  );
}

Container listOptions({
  required Widget child,
}) {
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

Center version(BuildContext context) {
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

Center logOut(
  BuildContext context, {
  void Function()? logOutPress,
  String? logOutWord,
}) {
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
          sb(w: 10.w),
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

GestureDetector accountOptionButton(
  BuildContext context, {
  required String optionText,
  required IconData optionIcon,
  void Function()? onOptionTap,
  required bool isLanguageOption,
  String? language,
}) {
  return GestureDetector(
    onTap: onOptionTap ?? null,
    child: Container(
      height: 40.h,
      width: 380.w,
      child: Row(
        children: [
          sb(w: 22.w),
          Icon(
            optionIcon,
            size: 30,
            color: premiumColor,
          ),
          sb(w: 10.w),
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
              padding: EdgeInsetsDirectional.only(end: 43.w),
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

ListTile accountInformationListTile(
  BuildContext context, {
  required String username,
  String? accountPhotoUrl,
  required String accountEmail,
  required void Function()? editPress,
}) {
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

Padding accountScreenTopic(BuildContext context) {
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
