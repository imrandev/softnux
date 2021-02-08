import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/routes/softnux_router.dart';
import 'package:softnux/ui/home/home.dart';
import 'package:softnux/ui/login/login.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => AuthenticationBloc(),
      child: SoftNuxApp(),
    ),
  );
}

class SoftNuxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(CheckAuthStatus());

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
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitialized) {
            return Home();
          }
          return Login();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
