import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(InitialLocationState());

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    yield InitialLocationState();
    try {
      if (event is CheckPermissionEvent){

        _determinePosition().then(
              (value) async* {
            yield LocationSuccess(
                lat: value.latitude, lng: value.longitude, message: "Successfully Location Received");
          },
          onError: (e) async* {
            yield LocationError(message: e.toString());
          },
        ).whenComplete(() => {
          Geolocator.getPositionStream(
            intervalDuration: Duration(
              seconds: 5,
            ),
            desiredAccuracy: LocationAccuracy.high,
          ).listen((Position position) async* {
            print(position == null
                ? 'Unknown'
                : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
            yield LocationSuccess(
                lat: position.latitude, lng: position.longitude, message: "Successfully Location Received");
          }),
        });
      } else if (event is LocationStatusEvent) {
        if (event.isEnabled){
          yield LocationEnabled();
        } else {
          yield LocationDisabled();
        }
      }
    } on Error {
      yield LocationError(message: "Something went wrong!");
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Position position = await Geolocator.getLastKnownPosition();
      if (position != null) return position;
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
