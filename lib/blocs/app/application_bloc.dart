import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:meta/meta.dart';
import 'package:softnux/services/analytics_service.dart';
import 'package:softnux/utills/prefs_util.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {

  final AnalyticsService _analyticsService;

  ApplicationBloc(this._analyticsService) : super(ApplicationInitial());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    yield ApplicationInitial();
    try {
      if (event is CurrentUserEvent) {
        String username = await PrefsUtil().getUsername();
        if (username.isNotEmpty) {
          FirebaseCrashlytics.instance.setUserIdentifier(username);
          _analyticsService.setUserProperties(userId: username);
          yield CurrentUserState(username);
        }
      } else if (event is BottomNavEvent) {
        switch(event.index) {
          case 1 :
            await _analyticsService.setCurrentScreenView("my_device");
            await _analyticsService.logEvent("my_device", _getParams(1));
            yield MyDeviceBottomNavState();
            break;
          case 2 :
            await _analyticsService.setCurrentScreenView("location");
            await _analyticsService.logEvent("location", _getParams(2));
            yield MyLocationBottomNavState();
            break;
          case 3 :
            await _analyticsService.setCurrentScreenView("more");
            await _analyticsService.logEvent("more", _getParams(3));
            yield MoreBottomNavState();
            break;
          case 0 :
            await _analyticsService.setCurrentScreenView("home");
            await _analyticsService.logEvent("home", _getParams(0));
            yield HomeBottomNavState();
            break;
        }
      } else if (event is SubmitFormEvent) {
        yield LoaderFormState(event.visibility);
      }
    } on Error {

    }
  }

  _getParams(int index) {
    return <String, dynamic>{
      'index': index,
    };
  }
}
