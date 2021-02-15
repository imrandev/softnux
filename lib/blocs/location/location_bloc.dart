import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(InitialLocationState());

  StreamSubscription<Position> _positionStreamSubscription;

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    try {

      if (event is InitialLocationEvent){
        _determinePosition().then((value) => {
          add(LocationReceivedEvent(lat: value.latitude, lng: value.longitude)),
        }, onError: (e) {
          add(LocationErrorEvent(message: e.toString()));
        }).whenComplete(() => {
          _positionStreamSubscription = Geolocator.getPositionStream(
            intervalDuration: Duration(
              seconds: 5,
            ),
            desiredAccuracy: LocationAccuracy.high,
          ).listen((Position position) {
            print(position == null
                ? 'Unknown'
                : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
            add(LocationReceivedEvent(lat: position.latitude, lng: position.longitude));
          }),
        });
      } else if (event is LocationStatusEvent) {
        if (event.isEnabled){
          yield LocationEnabled();
        } else {
          yield LocationDisabled();
        }
      } else if (event is LocationReceivedEvent){
        yield LocationSuccess(
            lat: event.lat, lng: event.lng, message: "Location Received", streamSubscription: _positionStreamSubscription);
      } else if (event is LocationErrorEvent){
        yield LocationError(message: event.message);
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
