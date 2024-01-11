part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLogin extends SplashState{}
final class SplashLoginRequired extends SplashState{}

final class SplashRegister extends SplashState{}
final class SplashRegisterRequired extends SplashState{}