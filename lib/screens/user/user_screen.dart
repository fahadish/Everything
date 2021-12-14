import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/user';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:  (_) =>UserScreen() );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(tittle: '  user ',),
      bottomNavigationBar: CustomNavBar(),
    );
  }}

