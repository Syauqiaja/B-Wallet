import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
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
              "Sign Up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 24,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter your name"
              ),
            ),
            const SizedBox(height: 24,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter your phone number"
              ),
            ),
            const SizedBox(height: 24,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email"
              ),
            ),
            const SizedBox(height: 24,),
            TextFormField(
              readOnly: true,
              onTap: (){
                showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
              },
              decoration: InputDecoration(
                labelText: "Birthday",
                hintText: "Enter your email or phone number",
                suffixIcon: Icon(Icons.calendar_month, color: AppColors.grey_2,)
              ),
            ),
            const SizedBox(height: 20,),
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
                    _passVisible? Icons.visibility : Icons.visibility_off,
                    color: AppColors.grey_2,
                  ),
                )
              ),
            ),
            
            const SizedBox(height: 20,),
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
                "Sign Up",
                style: AppTextStyle.semibold_16.copyWith(color: AppColors.white),
              )
            ),
            const SizedBox(height: 45,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have account? ",
                    style: AppTextStyle.regular_14.copyWith(color: AppColors.grey_2)
                  ),
                  TextSpan(
                    text: "Sign In",
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