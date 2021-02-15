part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {
  const LocationEvent();
}

class InitialLocationEvent extends LocationEvent {}

class LocationReceivedEvent extends LocationEvent {
  final double lat;
  final double lng;

  LocationReceivedEvent({this.lat, this.lng});

  List<Object> get props => [lat, lng];
}

class LocationErrorEvent extends LocationEvent {
  final String message;

  LocationErrorEvent({this.message});

  List<Object> get props => [message];
}

class LocationStatusEvent extends LocationEvent {
  final bool isEnabled;

  LocationStatusEvent(this.isEnabled);

  List<Object> get props => [isEnabled];
}
