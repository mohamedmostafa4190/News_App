import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

import 'app_style.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.blackColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.whiteColor,
      iconTheme: IconThemeData(color: AppColor.blackColor),
    ),
    scaffoldBackgroundColor: AppColor.whiteColor,
    canvasColor: AppColor.whiteColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.blackColor,
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(color: Colors.transparent),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicatorColor: AppColor.transparentColor,
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyle.headLineTextBlack,
      titleLarge: AppStyle.bold20Black,
      titleMedium: AppStyle.medium16Black,
      titleSmall: AppStyle.medium14White,
      labelLarge: AppStyle.medium20Black,
      labelMedium: AppStyle.bold16Black,
      labelSmall: AppStyle.medium12Grey,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.blackColor,
      iconTheme: IconThemeData(color: AppColor.whiteColor),
    ),
    canvasColor: AppColor.blackColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicatorColor: AppColor.transparentColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.blackColor,
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyle.headLineTextWhite,
      titleLarge: AppStyle.bold20White,
      titleMedium: AppStyle.medium16White,
      titleSmall: AppStyle.medium14Black,
      labelLarge: AppStyle.medium20White,
      labelMedium: AppStyle.bold16White,
      labelSmall: AppStyle.medium12Grey,
    ),
  );
}
