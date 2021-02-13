part of 'battery_bloc.dart';

@immutable
abstract class BatteryChangeState {
  const BatteryChangeState();
}

class BatteryInitial extends BatteryChangeState {}

class BatteryLevelChangeState extends BatteryChangeState {
  final int batteryLevel;
  final BatteryState batteryState;

  BatteryLevelChangeState(this.batteryLevel, this.batteryState);

  List<Object> get props => [batteryLevel, batteryState];
}