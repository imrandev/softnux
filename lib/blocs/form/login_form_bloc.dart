import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {

  LoginFormBloc() : super(LoginFormInitial(false, ""));

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event,) async* {
    yield LoginFormInitial(false, "");
    try {
      if (event is PasswordVisibilityEvent) {
        yield PasswordVisibilityState(event.visibility, event.password);
      }
    } on Error {

    }
  }
}
