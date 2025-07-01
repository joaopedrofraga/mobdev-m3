import 'package:flutter/material.dart';
import 'package:mobdev_m3/controller/app_colors.dart';

class AppTextStyles {
  static final AppTextStyles _singleton = AppTextStyles._internal();

  factory AppTextStyles() {
    return _singleton;
  }

  AppTextStyles._internal();

  static TextStyle get getNormalStyle =>
      TextStyle(color: AppColors.whiteColor, fontSize: 18);

  static TextStyle get getNormalBoldStyle =>
      getNormalStyle.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get getTitleStyle =>
      getNormalBoldStyle.copyWith(fontSize: 24);

  static TextStyle get getSmallStyle => getNormalStyle.copyWith(fontSize: 12);
}
