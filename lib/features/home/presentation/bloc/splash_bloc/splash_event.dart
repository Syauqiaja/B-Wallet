part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

final class SplashRequireLogin extends SplashEvent {}
final class SplashRequireRegister extends SplashEvent{}
final class SplashAnimationCompleted extends SplashEvent{}