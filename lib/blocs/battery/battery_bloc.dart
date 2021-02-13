import 'dart:async';

import 'package:battery/battery.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'battery_event.dart';
part 'battery_state.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryChangeState> {
  BatteryBloc() : super(BatteryInitial());

  @override
  Stream<BatteryChangeState> mapEventToState(
    BatteryEvent event,
  ) async* {
    try {
      if (event is BatteryChangeEvent) {
        Battery _battery = Battery();
        int _batteryLevel = 0;
        await _battery.batteryLevel.then((value) => {
          _batteryLevel = value
        });
        yield BatteryLevelChangeState(_batteryLevel, event.batteryState);
      }
    } on Error {

    }
  }
}
