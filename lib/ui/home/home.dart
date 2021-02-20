import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/location/location_bloc.dart';
import 'package:softnux/ui/fragments/home_fragment.dart';
import 'package:softnux/ui/fragments/my_device_fragment.dart';
import 'package:softnux/ui/fragments/more_fragment.dart';
import 'package:softnux/ui/fragments/my_location_fragment.dart';
import 'package:softnux/ui/widgets/circle_image_view.dart';
import 'package:softnux/utils/constant.dart';
import 'package:softnux/utils/prefs_util.dart';
import 'package:softnux/utils/routepath.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {

  int _currentIndex = 0;
  String _username = "";

  @override
  void initState() {
    BlocProvider.of<ApplicationBloc>(context).add(CurrentUserEvent());
    Future.delayed(
        const Duration(milliseconds: 500), () {
      BlocProvider.of<ApplicationBloc>(context).add(BottomNavEvent(_currentIndex));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: CircleImageView(
          imgUrl: FirebaseAuth.instance.currentUser == null
              ? Constant.defaultProfileAvatar
              : FirebaseAuth.instance.currentUser.photoURL,
          size: 36,
        ),
        title: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if (state is CurrentUserState) {
              this._username = state.username;
            }
            return Text(
              _username.isNotEmpty ? "Welcome $_username" : "Welcome Home",
            );
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
                    if (FirebaseAuth.instance.currentUser != null) {
                      FirebaseAuth.instance.signOut()
                    },
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
          } else if (state is HomeBottomNavState) {
            return HomeFragment();
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
