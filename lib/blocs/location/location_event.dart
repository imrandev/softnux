part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {
  const LocationEvent();
}

class CheckPermissionEvent extends LocationEvent {}

class LocationStatusEvent extends LocationEvent {
  final bool isEnabled;

  LocationStatusEvent(this.isEnabled);

  List<Object> get props => [isEnabled];
}
