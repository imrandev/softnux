import 'package:flutter/material.dart';
import 'package:softnux/ui/fragments/battery_info_fragment.dart';
import 'package:softnux/ui/fragments/device_info_fragment.dart';

class MyDeviceFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: double.infinity,
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TabBar(
                labelColor: Color(0xffE7014C),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.battery_alert,
                            size: 32,
                          ),
                          Text(
                            "Battery Info",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.perm_device_info,
                            size: 32,
                          ),
                          Text(
                            "Device Info",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  BatteryInfoFragment(),
                  DeviceInfoFragment(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}