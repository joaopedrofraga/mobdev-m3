import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  static Color get primaryColor => const Color.fromARGB(255, 2, 18, 69);

  static Color get backgroundColor => const Color.fromARGB(255, 1, 4, 9);

  static Color get whiteColor => Colors.white;
}
