import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:softnux/utills/prefs_util.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    yield ApplicationInitial();
    try {
      if (event is WelcomeEvent) {
        String username = "";
        await PrefsUtil().getUsername().then((value) => {
          username = value
        });
        if (username.isEmpty) {
          yield NoUsernameState();
        } else {
          yield UsernameState(username);
        }
      }
    } on Error {

    }
  }
}
