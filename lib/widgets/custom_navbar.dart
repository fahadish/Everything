import 'package:everything/blocs/cartBloc/cart_bloc.dart';
import 'package:everything/blocs/wishlist_bloc.dart';
import 'package:everything/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;
   const CustomNavBar({
    required this.screen,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          )),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          )),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const CircularProgressIndicator();
          }
          if (state is WishlistLoaded) {
            return IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                const snakBar =
                    SnackBar(content: Text('Added To Your Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snakBar);
                context.read<WishlistBloc>().add(AddWishListProduct(product));
              },
            );
          }
          return const Text('Something went wrong!');
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product));
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shape: const RoundedRectangleBorder()),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline5,
                ));
          }
          return const Text('Something Went Wrong!');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.headline4,
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        child: Text(
          'ORDER NOW',
          style: Theme.of(context).textTheme.headline5  ,
        ),
      )
    ];
  }

}
