part of 'battery_bloc.dart';

@immutable
abstract class BatteryEvent {}

class BatteryChangeEvent extends BatteryEvent {
  final BatteryState batteryState;

  BatteryChangeEvent(this.batteryState);

  List<Object> get props => [batteryState];
}
