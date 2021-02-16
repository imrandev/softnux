import 'dart:async';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/battery/battery_bloc.dart';

class BatteryInfoFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BatteryInfoState();
}

class _BatteryInfoState extends State<BatteryInfoFragment> {
  Battery _battery = Battery();
  StreamSubscription<BatteryState> _batteryStateSubscription;

  @override
  void initState() {
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      BlocProvider.of<BatteryBloc>(context).add(BatteryChangeEvent(state));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BlocBuilder<BatteryBloc, BatteryChangeState>(
          builder: (context, state) {
            if (state is BatteryLevelChangeState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    state.batteryState.index == 1 ? Icons.battery_charging_full_sharp : Icons.battery_std_outlined,
                    size: 120,
                    color: Color(0xffE7014C),
                  ),
                  Text(
                    "Battery : ${state.batteryLevel}%",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.batteryState.index == 1 ? "Device is charging" : "Device discharged",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription.cancel();
    }
  }
}
