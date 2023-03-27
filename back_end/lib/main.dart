import 'package:back_end/splash_screen.dart';
import 'package:flutter/material.dart';

import 'dummy.dart';
import 'login_signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        Dummy.route: (context) => Dummy(),
        LoginSignup.routeName: (context) => LoginSignup()
      },
    );
  }
}
