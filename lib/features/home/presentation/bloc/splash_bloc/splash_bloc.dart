import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashRequireLogin>((event, emit) async {
      emit(SplashLoginRequired());
    });
    on<SplashRequireRegister>((event, emit) async {
      emit(SplashRegisterRequired());
    });
    on<SplashAnimationCompleted>((event,emit) async {
      await Future.delayed(const Duration(microseconds: 1000));
      if(state is SplashLoginRequired){
        emit(SplashLogin());
      }else if(state is SplashRegisterRequired){
        emit(SplashRegister());
      }
    });
  }
}
