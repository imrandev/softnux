part of 'device_bloc.dart';

@immutable
abstract class DeviceState {
  const DeviceState();
}

class InitialDeviceState extends DeviceState {

}

class CheckDeviceState extends DeviceState {
  final Map<String, dynamic> deviceData;
  final List<ProcessorInfo> processorInfo;
  final DeviceMemory deviceMemory;

  CheckDeviceState(this.deviceData, this.processorInfo, this.deviceMemory);

  List<Object> get props => [deviceData, processorInfo, deviceMemory];
}