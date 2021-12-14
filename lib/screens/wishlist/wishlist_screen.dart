import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:  (_) =>WishlistScreen() );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(tittle: '  Wishlist ',),
      bottomNavigationBar: CustomNavBar(),
    );
  }}

