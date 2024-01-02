import "dart:core";

import "package:firebase_auth/firebase_auth.dart";

class AuthServices{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<SignInSignUpResult> createUser(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signInWithEmail(String email, String pass) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

class SignInSignUpResult{
  final User? user;
  final String? message;
  SignInSignUpResult({this.user, this.message});
}