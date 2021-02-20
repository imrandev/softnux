import 'package:softnux/utils/constant.dart';

class DeviceMemory {

  final int totalPhysicalMemory;
  final int freePhysicalMemory;
  final int totalVirtualMemory;
  final int freeVirtualMemory;
  final int virtualMemorySize;

  DeviceMemory(this.totalPhysicalMemory, this.freePhysicalMemory,
      this.totalVirtualMemory, this.freeVirtualMemory, this.virtualMemorySize);

  int get getTotalPhysicalMemory {
    return totalPhysicalMemory ~/ Constant.MEGABYTE;
  }

  int get getFreePhysicalMemory {
    return freePhysicalMemory ~/ Constant.MEGABYTE;
  }

  double get getFreePhysicalMemoryInPercentage {
    return (getFreePhysicalMemory * 100) / getTotalPhysicalMemory;
  }

  int get getTotalVirtualMemory {
    return totalVirtualMemory ~/ Constant.MEGABYTE;
  }

  int get getFreeVirtualMemory {
    return freeVirtualMemory ~/ Constant.MEGABYTE;
  }

  double get getFreeVirtualMemoryInPercentage {
    return (getFreeVirtualMemory * 100) / getTotalVirtualMemory;
  }

  int get getVirtualMemorySize {
    return virtualMemorySize ~/ Constant.MEGABYTE;
  }
}