import 'package:b_wallet/core/models/user_model.dart';
import 'package:b_wallet/core/network/auth_service.dart';
import 'package:b_wallet/features/home/data/user_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../firebase_options.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static const String userDontHaveSession = "User don't have session";

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthSendOTP>(_onAuthSendOtp);
    on<AuthRequestSession>(_onAuthRequestSession);
  }

  void _onAuthRequestSession(
    AuthRequestSession event,
    Emitter<AuthState> emit
  )async{
    //Check user auth
    //This must be called in at first shot
    await Future.delayed(const Duration(seconds: 2), () async {
      print("Firebase initializing....");
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    });

    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    
    if(isLogin){
      SignInSignUpResult result = await AuthServices.getUserSession();
      if(result.user != null){
        emit(AuthLoginSuccess(user: result.user!));
      }else{
        emit(AuthNotLogged());
      }
    }else{
      emit(AuthFailure(message: userDontHaveSession));
    }
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  )async {
    emit(AuthLoading());

    try {
      SignInSignUpResult result = await AuthServices.signInWithEmail(event.email, event.password);
      if(result.user != null){
        emit(AuthLoginSuccess(user: result.user!));
      }else if(result.message != null){
        emit(AuthFailure(message: result.message!));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      SignInSignUpResult result = await AuthServices.createUser(event.email, event.password);
      if(result.user != null){
        emit(AuthLoginSuccess(user: result.user!));
      }else if(result.message != null){
        emit(AuthFailure(message: result.message!));
      }
      
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  )async{
    await AuthServices.signOut();
    emit(AuthInitial());
  }

  void _onAuthSendOtp(
    AuthSendOTP event, 
    Emitter<AuthState> emit
  ){
    emit(AuthLoading());
    
  }

}
