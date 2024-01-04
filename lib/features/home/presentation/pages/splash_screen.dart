import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:b_wallet/features/home/presentation/widgets/logo_container.dart';
import 'package:b_wallet/features/home/presentation/widgets/pattern_background.dart';
import 'package:b_wallet/features/home/presentation/widgets/sign_in_form.dart';
import 'package:b_wallet/features/home/presentation/widgets/sign_up_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  bool _authContainerOpened = false;
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
    );

    topFlexAnimation = Tween<double>(begin: 1, end: 350)
      .animate(
        CurvedAnimation(
          parent: slideController, 
          curve: Curves.easeInOutSine, 
          reverseCurve: Curves.easeInCubic
        )
      )
      ..addListener(() => setState(() {}));
    
    //Check user auth
    Future.delayed(const Duration(seconds: 3),(){
      _authContainerOpened? slideController.reverse() : slideController.forward();
      setState(() {
        _authContainerOpened = !_authContainerOpened;
      });
    });
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
        decoration: BoxDecoration(
          color: AppColors.blue
        ),
        child: SafeArea(
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
                              SizedBox(height: 24,),
                              Text(
                                "B-Wallet",
                                style: AppTextStyle.semibold_32.copyWith(
                                  color: AppColors.white
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  body2: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _authContainerOpened ? 0 : 1,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          "Your best choice for E-Wallet",
                          style: AppTextStyle.regular_12.copyWith(
                            color: AppColors.white
                          ),
                        ),
                        const SizedBox(height: 32)
                      ],
                    ),
                  ),
                )
              ),
              AnimatedBuilder(
                animation: topFlexAnimation,
                builder: (context, child) {
                  return Expanded(
                    flex: topFlexAnimation.value.toInt(),
                    child: AnimatedOpacity(
                      opacity:topFlexAnimation.value.toInt() > 1? 1 : 0,
                      duration: slideController.duration!,
                      child: child!,
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    color: AppColors.white
                  ),
                  child: const Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SignInForm()
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

