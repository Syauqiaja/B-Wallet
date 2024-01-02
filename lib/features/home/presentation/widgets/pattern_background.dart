import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:flutter/material.dart';

import 'logo_container.dart';

class PatternBackground extends StatelessWidget {
  final Widget body;
  final Widget? body2;
  final Alignment? alignment;
  const PatternBackground({super.key, required this.body, this.body2, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: alignment ?? Alignment.center,
      children: [
        body,
        Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 1),
                Flexible(
                  child: Image.asset(
                    "images/pattern_top.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),
                Flexible(
                  child: Image.asset(
                    "images/pattern_bot.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
            if(body2 != null) body2!
          ],
        )
      ],
    );
  }
}