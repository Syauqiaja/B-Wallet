import "package:firebase_auth/firebase_auth.dart";

class AuthService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<SignInSignUpResult> createUser(String email, String pass) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
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

  static void signOut(){
    _auth.signOut();
  }
}

class SignInSignUpResult{
  final User? user;
  final String? message;
  SignInSignUpResult({this.user, this.message});
}