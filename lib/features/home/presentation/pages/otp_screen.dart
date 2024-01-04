
import "package:b_wallet/config/themes/colors.dart";
import "package:b_wallet/config/themes/text_style.dart";
import "package:b_wallet/features/home/presentation/widgets/pattern_background.dart";
import "package:b_wallet/features/home/presentation/widgets/snackbar_otp_error.dart";
import "package:flutter/material.dart";

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FocusNode parentFocus = FocusNode();
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  List<String> result = List.filled(4, "0", growable: false);

  void setString(String value, int position){
    result[position] = value;
    if(value.isEmpty){
      if(position > 0) {
        _focusNodes[position-1].requestFocus();
      }
    }else{
      if(position < _focusNodes.length-1) {
        _focusNodes[position+1].requestFocus();
      } else {
        _focusNodes[position].unfocus();
        submitString();
      }
    }
  }

  void submitString(){
    ScaffoldMessenger.of(context).showSnackBar(snackbarOtpError('Your OTP code is invalid.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.blue,
        ),
        child: PatternBackground(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white10,
                ),
                child: const Icon(
                  Icons.lock,
                  color: AppColors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Text(
                    "Enter the OTP Code",
                    style: AppTextStyle.medium_20.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    "We've send you an OTP code to",
                    style: AppTextStyle.regular_14.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    "081927364582",
                    style: AppTextStyle.bold_16.copyWith(color: AppColors.white),
                  ),
                ],
              ),
              const SizedBox(height: 66,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: Row(
                  children: [
                    OtpField(
                      focusNode: _focusNodes[0],
                      onFilled: (string1) => setString(string1, 0),
                    ),
                    const SizedBox(width: 12,),
                    OtpField(
                      focusNode: _focusNodes[1],
                      onFilled: (string1) => setString(string1, 1),
                    ),
                    const SizedBox(width: 12,),
                    OtpField(
                      focusNode: _focusNodes[2],
                      onFilled: (string1) => setString(string1, 2),
                    ),
                    const SizedBox(width: 12,),
                    OtpField(
                      focusNode: _focusNodes[3],
                      onFilled: (string1) => setString(string1, 3),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class OtpField extends StatefulWidget {
  final Function(String) onFilled;
  final FocusNode focusNode;
  const OtpField({
    super.key,
    required this.onFilled,
    required this.focusNode
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey_2),
            borderRadius: BorderRadius.circular(16)
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(16)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(16)
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyle.semibold_24.copyWith(color: AppColors.white),
        onChanged: widget.onFilled,
        focusNode: widget.focusNode,
      ),
    );
  }
}