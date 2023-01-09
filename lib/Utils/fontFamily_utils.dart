// FONT FAMILY
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import 'color_utils.dart';

const String poppinsFamily = "Poppins";


//FONT WEIGHT

class FontWeightClass {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

class FontTextStyle {
  // Title
  static TextStyle poppinsS26W7WhiteColor = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 32.sp,
      color: ColorUtils.whiteColor,
      fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS24W7PrimaryColor = TextStyle(
      fontFamily: poppinsFamily,
      fontSize: 24.sp,
      color: ColorUtils.primaryColor,
      fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS12W4PrimaryColor =
  poppinsS24W7PrimaryColor.copyWith(fontSize: 12.sp,fontWeight: FontWeightClass.regular);

  static TextStyle poppinsS14W4WhiteColor =
  poppinsS12W4PrimaryColor.copyWith(color: ColorUtils.whiteColor);

  static TextStyle poppinsS18W4blackColor =
  poppinsS12W4PrimaryColor.copyWith(color: ColorUtils.blackColor, fontSize: 18.sp,);

  static TextStyle poppinsS16W4blackColor =
  poppinsS12W4PrimaryColor.copyWith(
    color: ColorUtils.blackColor,
    fontSize: 16.sp,
      fontWeight: FontWeightClass.medium);

  static TextStyle poppinsS14W4blackColor =
  poppinsS12W4PrimaryColor.copyWith(color: ColorUtils.blackColor,
      fontWeight: FontWeightClass.semiB);

  static TextStyle poppinsS16W7WhiteColor =
  poppinsS12W4PrimaryColor.copyWith(fontSize: 16.sp,color: ColorUtils.whiteColor,fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS18W4GrayColor = TextStyle(
      fontFamily:poppinsFamily,
      fontSize: 14.sp,
      color: ColorUtils.blackColor,
      fontWeight: FontWeightClass.regular);

  static TextStyle poppinsS14HintColor =
  poppinsS12W4PrimaryColor.copyWith(
      color: ColorUtils.labelColor,
      fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS14W4PrimaryColor =
  poppinsS24W7PrimaryColor.copyWith(fontSize: 10.sp,fontWeight: FontWeightClass.medium);

  static TextStyle poppinsS16W4PrimaryColor =
  poppinsS24W7PrimaryColor.copyWith(fontSize: 14.sp,fontWeight: FontWeightClass.medium);


  static TextStyle poppinsS14W4GreyColor =
  poppinsS24W7PrimaryColor.copyWith( color:ColorUtils.labelColor, fontSize: 10.sp,fontWeight: FontWeightClass.regular);


}