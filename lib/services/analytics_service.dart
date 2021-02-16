import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsService {

  AnalyticsService({this.useGoogleAnalytics = true});

  final bool useGoogleAnalytics;
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      useGoogleAnalytics ? FirebaseAnalyticsObserver(analytics: _analytics) : null;

  Future<void> setUserProperties({@required String userId}) async {
    if (useGoogleAnalytics) {
      await _analytics.setUserId(userId);
    }
  }

  Future<void> logSignIn(String loginMethod) async {
    if (useGoogleAnalytics) {
      await _analytics.logLogin(loginMethod: loginMethod);
    }
  }

  Future<void> logSignUp(String signUpMethod) async {
    if (useGoogleAnalytics) {
      await _analytics.logSignUp(signUpMethod: signUpMethod);
    }
  }

  Future<void> logSignOut() async {
    if (useGoogleAnalytics) {
      await _analytics.logEvent(name: 'sign_out', parameters: <String, dynamic>{});
    }
  }

  setCurrentScreenView(String view) async {
    if (useGoogleAnalytics) {
      await _analytics.setCurrentScreen(
        screenName: view,
        screenClassOverride: view,
      );
    }
  }

  logEvent(String event, Map<String, dynamic> params) async {
    if (useGoogleAnalytics) {
      await _analytics.logEvent(
        name: event,
        parameters: params,
      );
    }
  }

  Future<void> setAnalyticsCollectionEnabled(bool isEnabled) async {
    if (useGoogleAnalytics) {
      await _analytics.setAnalyticsCollectionEnabled(isEnabled);
    }
  }
}