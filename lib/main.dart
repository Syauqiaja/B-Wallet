import 'package:b_wallet/config/routes/app_route.dart';
import 'package:b_wallet/config/themes/theme.dart';
import 'package:b_wallet/features/home/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:b_wallet/features/home/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        initialRoute: "/",
        onGenerateRoute: AppRoute().onGenerateRoute,
      ),
    );
  }
}
