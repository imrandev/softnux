import 'package:flutter/material.dart';
import 'package:softnux/routes/softnux_router.dart';
import 'package:softnux/utills/routepath.dart';

void main() {
  runApp(SoftNuxApp());
}

class SoftNuxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffE7014C),
        backgroundColor: Colors.white,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      title: "Softnux",
      onGenerateRoute: SoftNuxRouter.generateRoute,
      initialRoute: RoutePath.login,
      debugShowCheckedModeBanner: false,
    );
  }
}
