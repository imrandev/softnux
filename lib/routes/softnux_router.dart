import 'package:flutter/material.dart';
import 'package:softnux/ui/home/home.dart';
import 'package:softnux/ui/splash/splash_view.dart';
import 'file:///E:/Flutter/softnux/lib/ui/login/login.dart';
import 'package:softnux/utills/routepath.dart';

class SoftNuxRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePath.login:
        {
          return MaterialPageRoute(
            builder: (_) => Login(),
          );
        }
      case RoutePath.home:
        {
          return MaterialPageRoute(
            builder: (_) => Home(),
          );
        }
      case RoutePath.splash:
        {
          return MaterialPageRoute(
            builder: (_) => SplashView(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text("No route defined for ${routeSettings.name}"),
              ),
            ),
          );
        }
    }
  }
}
