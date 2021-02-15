part of 'analytics_bloc.dart';

@immutable
abstract class AnalyticsEvent {

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  final String name;

  AnalyticsEvent(this.observer, this.analytics, this.name);

  List<Object> get props => [observer, analytics, name];
}
