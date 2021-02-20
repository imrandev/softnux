import 'package:softnux/utils/constant.dart';

class DeviceMemory {
  final int _totalPhysicalMemory;
  final int _freePhysicalMemory;
  final int _totalVirtualMemory;
  final int _freeVirtualMemory;
  final int _virtualMemorySize;

  DeviceMemory(
      this._totalPhysicalMemory,
      this._freePhysicalMemory,
      this._totalVirtualMemory,
      this._freeVirtualMemory,
      this._virtualMemorySize);

  int get totalPhysicalMemory => _totalPhysicalMemory ~/ Constant.MEGABYTE;

  int get freePhysicalMemory => _freePhysicalMemory ~/ Constant.MEGABYTE;

  double get freePhysicalMemoryAtPercentage => (freePhysicalMemory * 100) / totalPhysicalMemory;

  int get totalVirtualMemory => _totalVirtualMemory ~/ Constant.MEGABYTE;

  int get freeVirtualMemory => _freeVirtualMemory ~/ Constant.MEGABYTE;

  double get freeVirtualMemoryAtPercentage => (freeVirtualMemory * 100) / totalVirtualMemory;

  int get virtualMemorySize => _virtualMemorySize ~/ Constant.MEGABYTE;
}