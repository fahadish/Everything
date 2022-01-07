import 'package:everything/models/checkout_model.dart';
import 'package:flutter/material.dart';
abstract class BaseCheckoutRepository{
  Future<void>addCheckout(Checkout  checkout);

}