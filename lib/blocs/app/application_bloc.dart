import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
      if (event is CurrentUserEvent) {
        String username = "";
        await PrefsUtil().getUsername().then((value) => {
          username = value
        });
        if (username.isNotEmpty) {
          FirebaseCrashlytics.instance.setUserIdentifier(username);
          yield CurrentUserState(username);
        }
      } else if (event is BottomNavEvent) {
        switch(event.index) {
          case 1 :
            yield MyDeviceBottomNavState();
            break;
          case 2 :
            yield MyLocationBottomNavState();
            break;
          case 3 :
            yield MoreBottomNavState();
            break;
          case 0 :
            yield HomeBottomNavState();
            break;
        }
      } else if (event is SubmitFormEvent) {
        yield SubmitFormState(event.visibility);
      }
    } on Error {

    }
  }
}
