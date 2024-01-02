import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_pin_event.dart';
part 'forgot_pin_state.dart';

class ForgotPinBloc extends Bloc<ForgotPinEvent, ForgotPinState> {
  ForgotPinBloc() : super(ForgotPinInitial()) {
    on<ForgotPinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
