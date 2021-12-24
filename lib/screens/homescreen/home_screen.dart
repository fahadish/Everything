import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything/blocs/categories/category_bloc.dart';
import 'package:everything/blocs/product/product_bloc.dart';
import 'package:everything/models/category_model.dart';
import 'package:everything/models/product_model.dart';
import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:everything/widgets/hero_carousel_card.dart';
import 'package:everything/widgets/product_card.dart';
import 'package:everything/widgets/product_crousel.dart';
import 'package:everything/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        tittle: '  Every Thing ',
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName,),
      body: Column(
        children: [
          Container(
            child: BlocBuilder<CategoryBloc, CategoryState>(
  builder: (context, state) {
    if(state is CategoryLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if(state is CategoryLoaded){
      return CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
        ),
        items: state.categories
            .map((category) => HeroCarouselCard(category: category, product: null,))
            .toList(),
      );
    }
    else{ return Text('Something Went Wrong.');}

  },
),
          ),
          SectionTitle(
            title: 'RECOMMENDED',
          ),
    ProductCarousel(products: Product.product.where((product) => product.isPopular).toList(),),

    SectionTitle(
            title: 'MOST POPULAR',
          ),
          ProductCarousel(products: Product.product.where((product) => product.isPopular).toList(),),
        ],
      ),
    );
  }
}
