part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState{}

final class AuthFailure extends AuthState{
  final String message;

  AuthFailure({required this.message});
}

final class AuthLoginSuccess extends AuthState{
  final User user;

  AuthLoginSuccess({required this.user});
}
final class AuthRegisterSuccess extends AuthState{
  final User user;

  AuthRegisterSuccess({required this.user});
}

final class AuthOTPSended extends AuthState{}
final class AuthOTPFailure extends AuthState{}
