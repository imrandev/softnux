import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:softnux/blocs/location/location_bloc.dart';

class MyLocationFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocationFragment> {
  /*StreamSubscription<Position> _positionStreamSubscription;*/

  @override
  void initState() {
    BlocProvider.of<LocationBloc>(context).add(CheckPermissionEvent());
    super.initState();
    LocationPermissions().serviceStatus.listen((event) {
      bool _isLocationEnabled = event == ServiceStatus.enabled ? true : false;
      BlocProvider.of<LocationBloc>(context)
          .add(LocationStatusEvent(_isLocationEnabled));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        bool _isLocationEnabled = false;
        double _lat = 0.0;
        double _lng = 0.0;

        if (state is LocationSuccess) {
          _lat = state.lat;
          _lng = state.lng;
        } else if (state is LocationEnabled) {
          _isLocationEnabled = true;
        }

        return Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Latitude : $_lat Longitude : $_lng",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () => {

                      },
                      backgroundColor: Colors.blue,
                      child: Icon(
                        _isLocationEnabled
                            ? Icons.location_on
                            : Icons.location_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    /*if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }*/
    super.dispose();
  }
}
