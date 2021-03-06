part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState {
  const CheckoutState();

  List<Object?> get props => [];

}


class CheckoutLoading extends CheckoutState {}
class CheckoutLoaded extends CheckoutState {

  final String?  fullName;
  final String?  email;
  final String?  address;
  final String?  city;
  final String?  country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded({this.fullName, this.email, this.address, this.city, this.country, this.zipCode, this.products, this.subtotal, this.deliveryFee, this.total}): checkout = Checkout(fullName: fullName,email: email,address: address,city: country,country: country,
    zipCode: zipCode,products: products,subtotal: subtotal,total: total,deliveryFee: deliveryFee
  );
  @override

  List<Object?> get props => [
    fullName, email,address,city,country,zipCode,products,subtotal,deliveryFee,total
  ];
}
