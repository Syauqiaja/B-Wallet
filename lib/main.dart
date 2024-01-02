import 'package:b_wallet/config/themes/theme.dart';
import 'package:b_wallet/features/home/presentation/pages/home_screen.dart';
import 'package:b_wallet/features/home/presentation/pages/otp_screen.dart';
import 'package:b_wallet/features/home/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: "/otp",
      routes: {
        "/" : (context) => const SplashScreen(),
        "/home" : (context) => const HomeScreen(),
        "/otp" :(context) => const OtpScreen()
      },
    );
  }
}
