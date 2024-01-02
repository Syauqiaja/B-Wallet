import "package:b_wallet/config/themes/colors.dart";
import "package:b_wallet/config/themes/text_style.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

ThemeData appTheme = ThemeData(
  fontFamily: 'Inter',
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTextStyle.regular_14.copyWith(color: AppColors.grey_2),
    labelStyle: AppTextStyle.regular_14.copyWith(color: AppColors.grey_2),
    floatingLabelStyle: AppTextStyle.regular_14.copyWith(color: AppColors.blue),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.grey_3)
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blue)
    )
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.blue,
      statusBarBrightness: Brightness.dark
    ),
    backgroundColor: AppColors.blue,
    iconTheme: IconThemeData(
      color: AppColors.white,
    )
  )
);