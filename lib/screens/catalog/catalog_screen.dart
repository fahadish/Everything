import 'package:everything/models/category_model.dart';
import 'package:everything/models/models.dart';
import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:everything/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(
              category: category,
            ));
  }

  final Category category;
  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.product.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        tittle: category.name,
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName,),

      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          itemCount: categoryProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: ProductCard(
              product: categoryProducts[index],
              withFactor: 2.2,
            ));
          }),
      // body:
    );
  }
}
