import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/routes/softnux_router.dart';
import 'package:softnux/services/analytics_service.dart';
import 'package:softnux/ui/splash/splash_animation_view.dart';

final AnalyticsService analyticsService = AnalyticsService(
  useGoogleAnalytics: true,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AuthenticationBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => ApplicationBloc(analyticsService),
          ),
        ],
        child: SoftNuxApp(),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
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
      navigatorObservers: [
        analyticsService.getAnalyticsObserver(),
      ],
      home: SplashAnimationView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
