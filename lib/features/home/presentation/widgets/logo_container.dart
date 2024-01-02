import 'package:b_wallet/config/themes/colors.dart';
import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white
      ),
      constraints: const BoxConstraints(
        maxHeight: 100
      ),
      padding: const EdgeInsets.all(24),
      child: Image.asset(
        "images/logo.png"
      ),
    );
  }
}