part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class InitialLocationState extends LocationState {}

class LocationEnabled extends LocationState {}

class LocationDisabled extends LocationState {}

class LocationSuccess extends LocationState {
  final double lat;
  final double lng;
  final String message;

  LocationSuccess({this.lat, this.lng, @required this.message});

  List<Object> get props => [lat, lng, message];
}

class LocationError extends LocationState {
  final String message;

  LocationError({@required this.message});

  List<Object> get props => [message];
}
