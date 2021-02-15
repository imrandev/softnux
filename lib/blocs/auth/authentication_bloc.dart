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
    try {
      if (event is CheckAuthStatus) {
        if (await PrefsUtil().isLoggedIn()) {
          yield AuthenticationInitialized();
        } else {
          yield AuthenticationUninitialized();
        }
      }
    } on Error {

    }
  }
}
