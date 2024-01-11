import 'package:b_wallet/config/themes/colors.dart';
import 'package:b_wallet/config/themes/text_style.dart';
import 'package:b_wallet/features/home/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:b_wallet/features/home/presentation/widgets/snackbar_otp_error.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/splash_bloc/splash_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  bool _passVisible = false;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              controller: _emailController,
            ),
            const SizedBox(height: 24,),
            TextFormField(
              readOnly: true,
              onTap: (){
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(1900), 
                  lastDate: DateTime.now());
              },
              decoration: const InputDecoration(
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
              controller: _passController,
            ),
            
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  context.read<AuthBloc>().add(
                      AuthRegisterRequested(
                        email: _emailController.text, 
                        password: _passController.text)
                      );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(snackbarOtpError("Please fill in all required fields"));
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                    style: AppTextStyle.semibold_14.copyWith(color: AppColors.orange),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      context.read<SplashBloc>().add(SplashRequireLogin());
                    }
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