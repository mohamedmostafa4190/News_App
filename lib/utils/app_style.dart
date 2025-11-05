import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppStyle {
  AppStyle._();

  static final TextStyle headLineTextBlack = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );
  static final TextStyle bold20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.blackColor,
  );

  static final TextStyle medium20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );
  static final TextStyle bold16Black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.blackColor,
  );
  static final TextStyle medium12Grey = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );
  static final TextStyle medium14Black = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );
  static final TextStyle medium16Black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );

  //________________________________________________________________
  static final TextStyle headLineTextWhite = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static final TextStyle bold20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
  );
  static final TextStyle medium20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static final TextStyle bold16White = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.whiteColor,
  );
  static final TextStyle medium14White = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static final TextStyle medium16White = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static final TextStyle medium12White = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );
}
