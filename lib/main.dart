import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/routes/softnux_router.dart';
import 'package:softnux/ui/splash/splash_animation_view.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => ApplicationBloc(),
        ),
      ],
      child: SoftNuxApp(),
    ),
  );
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
      home: SplashAnimationView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
