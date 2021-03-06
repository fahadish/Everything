import 'package:everything/models/models.dart';
import 'package:everything/screens/screens.dart';
import 'package:everything/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route? onGenerateRoute(RouteSettings settings){
    print('this is route : ${settings.name}');

    switch(settings.name) {

      case '/':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CheckoutScreen.routName:
        return CheckoutScreen.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishlistScreen.routeName:
        return WishlistScreen.route();



      default:
        return _errorRoute();
    }


  }
  static Route _errorRoute(){

    return MaterialPageRoute(
        settings: const RouteSettings(name: 'error'),
        builder:  (_) => Scaffold(appBar: AppBar(title: const Text('error'),),) );

  }
  }