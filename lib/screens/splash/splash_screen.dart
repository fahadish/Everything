import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), ()=> Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
Center(
  child: Image.asset('assets/logo_transparent.png'),
)

      ],),
    );
  }
}
