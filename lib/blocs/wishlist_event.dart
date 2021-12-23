part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class StartWishList extends WishlistEvent{
}

class AddWishListProduct extends WishlistEvent{
final Product product;

  AddWishListProduct(this.product);
List<Object>get props =>[product];

}

class RemoveWishListProduct extends WishlistEvent{
  final Product product;

  RemoveWishListProduct(this.product);
  List<Object>get props =>[product];

}