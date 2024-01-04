import 'package:email_validator/email_validator.dart';

class FormValidator{
  static String? validateEmail(String? text){
    if(text == null){
      return "Please write your email";
    }else if(EmailValidator.validate(text) == true){
      return null;
    }
    return "Please write the correct email.";
  }

  static String? validatePassword(String? text){
    if(text == null || text.isEmpty){
      return "Please write your password";
    }
    return null;
  }
  static String? validatePasswordFull(String? text){
    if(text == null || text.isEmpty){
      return "Please write your desired password";
    }else{
      if(text.length < 8){
        return "The password must be at least 8 characters long.";
      }else if(!text.contains(RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$'))){
        return "The password is not match the requirements.";
      }
    }
    return null;
  }
}