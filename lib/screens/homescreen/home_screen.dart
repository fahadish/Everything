import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything/models/category_model.dart';
import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:everything/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: const CustomAppBar(
        tittle: '  Every Thing ',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
            ),
            items: Category.categories.map((category) =>HeroCarouselCard(category: category) ).toList(),
          ),
      ),
    );
  }
}


