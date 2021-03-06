import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:softnux/blocs/location/location_bloc.dart';

class MyLocationFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocationFragment> {

  Completer<GoogleMapController> _controller = Completer();
  bool _isLocationEnabled = false;
  Set<Marker> markers = Set();

  @override
  void initState() {
    BlocProvider.of<LocationBloc>(context).add(InitialLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {

        if (state is LocationSuccess) {
          _updateCamera(state.lat, state.lng);
        } else if (state is LocationEnabled) {
          _isLocationEnabled = true;
        } else if (state is LocationDisabled) {
          _isLocationEnabled = false;
        }

        return Container(
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(23.791073599999997, 90.41655519999999),
                  tilt: 59.440717697143555,
                  zoom: 19.151926040649414,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: markers,
              ),
              Positioned(
                bottom: 108,
                right: 8,
                child: FloatingActionButton(
                  onPressed: () => {

                  },
                  child: Icon(
                    _isLocationEnabled ? Icons.location_on : Icons.location_off,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updateCamera(double lat, double lng) async {
    // adding updated location markers onto the google map
    markers.add(
      Marker(
        markerId: MarkerId('value'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: await _getAddressFromLocation(lat, lng),
        ),
      ),
    );

    final GoogleMapController controller = await _controller.future;
    // change the camera position with the new update location
    controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(lat, lng),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414,
            ),
        ),
    );
  }

  _getAddressFromLocation(latitude, longitude) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
    String address = "No Address found";
    if (placeMarks.isNotEmpty) {
      address = placeMarks[1].name + ", " + placeMarks[1].locality + ", " + placeMarks[0].country;
    }
    return address;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
