import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:softnux/data/device_memory.dart';
import 'package:system_info/system_info.dart';

part 'device_event.dart';

part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  DeviceBloc() : super(InitialDeviceState());

  @override
  Stream<DeviceState> mapEventToState(DeviceEvent event) async* {
    yield InitialDeviceState();
    try {
      if (event is CheckDeviceEvent) {

        var deviceMemory = new DeviceMemory(
          SysInfo.getTotalPhysicalMemory(),
          SysInfo.getFreePhysicalMemory(),
          SysInfo.getTotalVirtualMemory(),
          SysInfo.getFreeVirtualMemory(),
          SysInfo.getVirtualMemorySize(),
        );

        yield CheckDeviceState(await initPlatformState(), SysInfo.processors, deviceMemory);
      }
    } on Error {

    }
  }

  Future<Map<String, dynamic>> initPlatformState() async {
    Map<String, dynamic> deviceData;
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
