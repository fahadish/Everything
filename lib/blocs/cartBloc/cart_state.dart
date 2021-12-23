part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartLoading extends CartState {
  List<Object> get props => [];
}
class CartLoaded extends CartState {
final Cart cart;
CartLoaded({this.cart = const Cart()});

  List<Object> get props => [cart];


}
class CartError extends CartState {
  List<Object> get props => [];
}


