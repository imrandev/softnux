import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:softnux/utills/prefs_util.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationLoading());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    yield AuthenticationLoading();
    try {
      if (event is CheckAuthStatus) {
        bool isLogged = false;
        await PrefsUtil().isLoggedIn().then((value) => {
          isLogged = value
        });
        if (isLogged) {
          yield AuthenticationInitialized();
        } else {
          yield AuthenticationUninitialized();
        }
      }
    } on Error {

    }
  }
}
