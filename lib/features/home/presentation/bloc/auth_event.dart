part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent{
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

final class AuthRegisterRequested extends AuthEvent{
  final UserModel userModel;
  final String password;

  AuthRegisterRequested({required this.userModel, required this.password});

}

final class AuthSendOTP extends AuthEvent{
  final String phoneNumber;
  final String code;

  AuthSendOTP({required this.phoneNumber, required this.code});
}

final class AuthResendTOP extends AuthEvent{}

final class AuthLogoutRequested extends AuthEvent{}