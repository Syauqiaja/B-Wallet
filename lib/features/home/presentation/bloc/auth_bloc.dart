import 'package:b_wallet/core/models/user_model.dart';
import 'package:b_wallet/core/network/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthSendOTP>(_onAuthSendOtp);
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
      SignInSignUpResult result = await AuthServices.createUser(event.userModel.email, event.password);
      if(result.user != null){
        emit(AuthRegisterSuccess(user: result.user!));
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
