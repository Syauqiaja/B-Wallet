import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:flutter/material.dart';

SnackBar snackbarOtpError(String textToShow) => SnackBar(
  content: Row(
    children: [
      const Icon(
        Icons.error_rounded,
        color: AppColors.white,
      ),
      const SizedBox(width: 12,),
      Text(
        textToShow,
        style: AppTextStyle.regular_16.copyWith(color: AppColors.white),
      )
    ],
  ),
  backgroundColor: AppColors.red,
  margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8)
  ),
  elevation: 0,
  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
);