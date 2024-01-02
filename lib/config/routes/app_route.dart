import 'package:b_wallet/features/error/pages/error_404.dart';
import 'package:b_wallet/features/home/presentation/pages/home_screen.dart';
import 'package:b_wallet/features/home/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute{
  Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Error404Page());
    }
  }
}