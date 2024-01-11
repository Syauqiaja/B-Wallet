import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:b_wallet/features/home/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:b_wallet/features/home/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:b_wallet/features/home/presentation/widgets/logo_container.dart';
import 'package:b_wallet/features/home/presentation/widgets/pattern_background.dart';
import 'package:b_wallet/features/home/presentation/widgets/sign_in_form.dart';
import 'package:b_wallet/features/home/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final int _topFlex = 200;

  late Animation<double> topFlexAnimation;
  late AnimationController slideController;

  @override
  void initState() {
    super.initState();
    slideController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 500)
      )..addStatusListener((status) {
        if(status == AnimationStatus.dismissed){
          context.read<SplashBloc>().add(SplashAnimationCompleted());
        }
      });

    topFlexAnimation = Tween<double>(begin: 1, end: 350).animate(
        CurvedAnimation(
            parent: slideController,
            curve: Curves.easeInOutSine,
            reverseCurve: Curves.easeInCubic))
      ..addListener(() => setState(() {}));

    context.read<AuthBloc>().add(AuthRequestSession());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.blue),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                      flex: _topFlex,
                      child: PatternBackground(
                        alignment: Alignment.bottomCenter,
                        body: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const LogoContainer(),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "B-Wallet",
                                      style: AppTextStyle.semibold_32
                                          .copyWith(color: AppColors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      )),
                  AnimatedBuilder(
                    animation: topFlexAnimation,
                    builder: (context, child) {
                      return Expanded(
                        flex: topFlexAnimation.value.toInt(),
                        child: AnimatedOpacity(
                          opacity: topFlexAnimation.value.toInt() > 1 ? 1 : 0,
                          duration: slideController.duration!,
                          child: child!,
                        ),
                      );
                    },
                    child: BlocConsumer<SplashBloc, SplashState>(
                      builder: (context, state) {
                        if(state is SplashRegister) {
                          return formContainer(const SignUpForm());
                        }else if(state is SplashLogin || state is SplashInitial){
                          return formContainer(const SignInForm());
                        }else{
                          return Container();
                        }
                      },
                      buildWhen: (previous, current) {
                        return current is! SplashRegisterRequired && current is! SplashLoginRequired;
                      },
                      listener: (context, state){
                        if(state is SplashLoginRequired || state is SplashRegisterRequired){
                          slideController.reverse();
                        }else if(state is SplashLogin || state is SplashRegister){
                          slideController.forward();
                        }
                      }
                    ),
                  )
                ],
              ),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return Container();
                }
              }, listener: (context, state) {
                if (state is AuthLoginSuccess) {
                  Navigator.of(context).pushNamed("/home");
                }else if(state is AuthFailure || state is AuthNotLogged){
                    slideController.forward();
                }
              }
            ),
          ],
        ),
      ),
    );
  }

  Container formContainer(Widget widget) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: AppColors.white),
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: widget),
      ),
    );
  }
}
