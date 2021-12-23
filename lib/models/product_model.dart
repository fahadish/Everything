import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];
  static List<Product> product = [
    Product(
        name: 'Soft Drinks #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1596803244618-8dbee441d70b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Soft Drinks #2',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1629059042675-ce386c84cebf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        price: 3.99,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'Soft Drinks #3',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1524802020103-aa46eaffcaa2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 1.99,
        isRecommended: true,
        isPopular: true),
    Product(
        name: 'Smoothies #1',
        category: 'Smooties',
        imageUrl:
            'https://images.unsplash.com/photo-1577805947697-89e18249d767?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=398&q=80',
        price: 4.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1577594412764-f8fa57d4e5b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        price: 1.99,
        isRecommended: false,
        isPopular: false),
    Product(
        name: 'Smoothies #3',
        category: 'Smoothies',
        imageUrl:
        'https://images.unsplash.com/photo-1496318447583-f524534e9ce1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80',
        price: 4.99,
        isRecommended: false,
        isPopular: true),
  ];
}
