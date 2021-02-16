import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/battery/battery_bloc.dart';
import 'package:softnux/blocs/device/device_bloc.dart';
import 'package:softnux/ui/fragments/battery_info_fragment.dart';
import 'package:softnux/ui/fragments/device_info_fragment.dart';

class MyDeviceFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDeviceFragment> {


  @override
  void initState() {
    super.initState();
  }

  _changedTabbedListener(){
    int index = DefaultTabController.of(context).index;
    if (index == 0) {
      print("Battery Tab");
    } else if (index == 1) {
      print("Device Tab");
    }
  }

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
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => BatteryBloc(),
                  ),
                  BlocProvider(
                    create: (context) => DeviceBloc(),
                  ),
                ],
                child: TabBarView(
                  children: [
                    BatteryInfoFragment(),
                    DeviceInfoFragment(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
