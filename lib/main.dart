import 'package:everything/blocs/categories/category_bloc.dart';
import 'package:everything/blocs/checkout/checkout_bloc.dart';
import 'package:everything/blocs/product/product_bloc.dart';
import 'package:everything/blocs/wishlist_bloc.dart';
import 'package:everything/config/app_route.dart';
import 'package:everything/repositories/category/category_repository.dart';
import 'package:everything/repositories/checkout/checkout_repository.dart';
import 'package:everything/repositories/product/product_repository.dart';
import 'package:everything/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/cartBloc/cart_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (context) => CheckoutBloc(cartBloc: context.read<CartBloc>(), checkoutRepository: CheckoutRepository(),), ),
        BlocProvider(create: (_)=> CategoryBloc(categoryRepository:
        CategoryRepository())..add(LoadCategories(),)
          ,),
        BlocProvider(create: (_)=> ProductBloc(productRepository: ProductRepository())..add(LoadProducts(),),),

      ],
      child: MaterialApp(
        title: 'EveryThing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName ,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
