import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/ui/home/home.dart';
import 'package:softnux/ui/login/login.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {

  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context).add(CheckAuthStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      title: new Text(
        'SoftNux',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white),
      ),
      image: new Image.asset(
        'assets/images/splash_logo.png',
      ),
      photoSize: 60,
      loaderColor: Colors.white,
      gradientBackground: LinearGradient(
        colors: [Color(0xffE7014C), Color(0xffF3202F)],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
      /*pageRoute: _createRoute(),*/
      navigateAfterSeconds: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitialized) {
            return Home();
          } else {
            return Login();
          }
        },
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {

        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationInitialized) {
              return Home();
            } else if (state is AuthenticationUninitialized) {
              return Login();
            } else {
              return Container();
            }
          },
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
