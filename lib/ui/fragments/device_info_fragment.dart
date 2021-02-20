
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:softnux/blocs/device/device_bloc.dart';
import 'package:softnux/ui/widgets/circle_text_view.dart';

class DeviceInfoFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 1000), () {
      BlocProvider.of<DeviceBloc>(context).add(CheckDeviceEvent());
    });

    return Container(
      height: double.infinity,
      child: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          if (state is CheckDeviceState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "System Memory Info",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Free Virtual Memory : ${state.deviceMemory.freeVirtualMemory} MB",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      percent: state
                          .deviceMemory.freeVirtualMemoryAtPercentage /
                          100,
                      lineHeight: 12,
                      progressColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Free Physical Memory : ${state.deviceMemory.freePhysicalMemory} MB",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      percent: state.deviceMemory
                          .freePhysicalMemoryAtPercentage /
                          100,
                      lineHeight: 12,
                      progressColor: Colors.green,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleTextView(
                              text: "${(state.deviceMemory.totalVirtualMemory / 1024).ceil()}",
                              subText: "GB",
                            ),
                            CircleTextView(
                              text: "${(state.deviceMemory.totalPhysicalMemory ~/ 1024).ceil()}",
                              subText: "GB",
                            ),
                            CircleTextView(
                              text: "${(state.deviceMemory.virtualMemorySize ~/ 1024).ceil()}",
                              subText: "GB",
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 64,
                              child: Text(
                                "Total Virtual Memory",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 64,
                              child: Text(
                                "Total Physical Memory",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 64,
                              child: Text(
                                "Virtual Memory Size",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "About Phone",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: state.deviceData.keys.map(
                            (String property) {
                          return Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      property
                                          .replaceAll("version.", "")
                                          .trim(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: Text(
                                        '${state.deviceData[property]}',
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Divider(
                                thickness: 0,
                                height: 0,
                                color: property.contains("systemFeatures")
                                    ? Colors.transparent
                                    : Colors.grey,
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
