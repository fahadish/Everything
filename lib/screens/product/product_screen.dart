import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:  (_) =>ProductScreen());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(tittle: '  Product ',),
      bottomNavigationBar: CustomNavBar(),
    );
  }}

