import 'package:everything/blocs/cartBloc/cart_bloc.dart';
import 'package:everything/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double? withFactor;
  final double? leftPosition;
  final bool? isWishList;
  const ProductCard({
    Key? key,
    this.withFactor = 2.5,
    this.leftPosition = 5,
    required this.product,
    this.isWishList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / withFactor!;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              width: widthValue - 5 - leftPosition!,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition! + 5,
            child: Container(
              width: widthValue - 15 - leftPosition!,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${Product.product[0].price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
if (state is CartLoading) {
  return const Center(child: CircularProgressIndicator(),);
}
if (state is CartLoaded) {
  return Expanded(
    child: IconButton(
      onPressed: () {
        context.read<CartBloc>().add(CartProductAdded(product));
      },
      icon: const Icon(
        Icons.add_circle,
        color: Colors.white,
      ),
    ),
  );
}
else {return const Text('Something Went Wrong.'); }
    

  },
),
                    if (isWishList!)
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
