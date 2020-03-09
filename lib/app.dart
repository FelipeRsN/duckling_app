import 'package:duckling/screen/home.dart';
import 'package:duckling/screen/intro.dart';
import 'package:duckling/screen/login.dart';
import 'package:duckling/screen/register.dart';
import 'package:duckling/screen/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/constants.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        AppConstants.route_intro: (BuildContext context) => IntroScreen(),
        AppConstants.route_register: (BuildContext context) => RegisterScreen(),
        AppConstants.route_login: (BuildContext context) => LoginScreen(),
        AppConstants.route_home: (BuildContext context) => HomeScreen(),
      },
    );
  }
}
