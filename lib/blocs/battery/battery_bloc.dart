import 'dart:async';

import 'package:battery/battery.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'battery_event.dart';
part 'battery_state.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryChangeState> {
  BatteryBloc() : super(BatteryInitial());

  @override
  Stream<BatteryChangeState> mapEventToState(BatteryEvent event) async* {
    try {
      if (event is BatteryChangeEvent) {
        yield BatteryLevelChangeState( await Battery().batteryLevel, event.batteryState);
      }
    } on Error {

    }
  }
}
