import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/location/location_bloc.dart';
import 'package:softnux/ui/fragments/home_fragment.dart';
import 'package:softnux/ui/fragments/my_device_fragment.dart';
import 'package:softnux/ui/fragments/more_fragment.dart';
import 'package:softnux/ui/fragments/my_loaction_fragment.dart';
import 'package:softnux/utills/prefs_util.dart';
import 'package:softnux/utills/routepath.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {

  int _currentIndex = 0;
  String _username;

  @override
  void initState() {
    BlocProvider.of<ApplicationBloc>(context).add(CurrentUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 30,
        ),
        title: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if (state is CurrentUserState) {
              this._username = state.username;
              return Text(
                "Welcome $_username",
              );
            } else {
              return Text(
                _username != null ? "Welcome $_username" : "Welcome Home",
              );
            }
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                InkWell(
                  onTap: () => {
                    PrefsUtil().saveSession(false),
                    Navigator.popAndPushNamed(context, RoutePath.login),
                  },
                  customBorder: CircleBorder(),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffE7014C),
        unselectedItemColor: Color(0xffC4B9AF),
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (value) {
          BlocProvider.of<ApplicationBloc>(context).add(BottomNavEvent(value));
          setState(() {
            _currentIndex = value;
          });
        },
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.devices),
            label: "MyDevice",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location),
            label: "MyLocation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
      body: BlocBuilder<ApplicationBloc, ApplicationState> (
        builder: (context, state) {
          if (state is MyDeviceBottomNavState) {
            return MyDeviceFragment();
          } else if (state is MyLocationBottomNavState) {
            return BlocProvider(
              create: (context) => LocationBloc(),
              child: MyLocationFragment(),
            );
          } else if (state is MoreBottomNavState) {
            return MoreFragment();
          } else {
            return HomeFragment();
          }
        },
      ),
    );
  }
}
