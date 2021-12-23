import 'package:everything/models/product_model.dart';
import 'package:everything/widgets/product_card.dart';
import 'package:flutter/material.dart';
class ProductCarousel extends StatelessWidget {

  final List<Product> products;
  const ProductCarousel({
    Key? key,required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          scrollDirection: Axis.horizontal
          ,itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child:   ProductCard(product: products[index],),
            );
          }),
    );
  }
}

