import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:meta/meta.dart';

part 'analytics_event.dart';

part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(InitialAnalyticsState());

  @override
  Stream<AnalyticsState> mapEventToState(AnalyticsEvent event) async* {
    try {
      //_sendAnalyticsEvent(event.analytics);
    } on Error {

    }
  }

  Future<void> _sendAnalyticsEvent(analytics) async {
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'string',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        'bool': true,
      },
    );
  }
}
