part of 'checkout_bloc.dart';


@immutable
abstract class CheckoutEvent {
   CheckoutEvent();
  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent{
  final String?  fullName;
  final String?  email;
  final String?  address;
  final String?  city;
  final String?  country;
  final String? zipCode;
final Cart? cart;

  UpdateCheckout({this.fullName, this.email, this.address, this.city, this.country, this.zipCode, this.cart});

  List<Object?> get props => [fullName,email,address,city,country,zipCode,cart];
}

class ConfirmCheckout extends CheckoutEvent{
  final Checkout checkout;

  ConfirmCheckout({required this.checkout});
  List<Object?> get props => [checkout];
}