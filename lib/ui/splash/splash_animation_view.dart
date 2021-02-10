import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/ui/home/home.dart';
import 'package:softnux/ui/login/login.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashAnimationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitialized) {
            return Home();
          } else if (state is AuthenticationUninitialized) {
            return Login();
          } else {
            return Container();
          }
        },
      ),
      title: new Text(
        'SoftNux',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
          color: Colors.white
        ),
      ),
      image: new Image.asset(
        'assets/images/avatar.png',
        height: 400,
        width: 400,
      ),
      backgroundColor: Color(0xffE7014C),
      loaderColor: Colors.white,
    );
  }
}
