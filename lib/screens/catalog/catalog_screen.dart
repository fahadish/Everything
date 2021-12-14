import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:  (_) =>CatalogScreen() );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(tittle: ' Catalog ',),
      bottomNavigationBar: CustomNavBar(),
    );
  }}

