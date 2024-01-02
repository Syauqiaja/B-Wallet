import 'package:b_wallet/config/routes/app_route.dart';
import 'package:b_wallet/config/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: "/",
      onGenerateRoute: AppRoute().onGenerateRoute,
    );
  }
}
