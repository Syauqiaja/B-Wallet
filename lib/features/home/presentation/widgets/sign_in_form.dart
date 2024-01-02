import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  bool _passVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 24,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email/Phone",
                hintText: "Enter your email or phone number"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: !_passVisible,
              decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                suffixIcon: GestureDetector(
                  onTap: ()=>setState(() {
                    _passVisible = !_passVisible;
                  }),
                  child: Icon(
                    _passVisible? Icons.visibility : Icons.visibility_off
                  ),
                )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              child: Text(
                "Sign In",
                style: AppTextStyle.semibold_16.copyWith(color: AppColors.white),
              )
            ),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = (){},
                text: "Forgot Password?",
                style: AppTextStyle.semibold_14.copyWith(color: AppColors.orange),
              ),
            ),
            const SizedBox(height: 45,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have account yet? ",
                    style: AppTextStyle.regular_14.copyWith(color: AppColors.grey_2)
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: AppTextStyle.semibold_14.copyWith(color: AppColors.orange)
                  )
                ]
              )
            ),
          ]
        ),
      ),
    );
  }
}