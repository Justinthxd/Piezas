@JS()
library stripe;

import 'package:flutter/material.dart';
import 'package:js/js.dart';

import '../data/constants.dart';

void redirectToCheckout(BuildContext _, List<LineItem> items) async {
  final stripe = Stripe(apiKey);
  stripe.redirectToCheckout(
    CheckoutOptions(
      lineItems: items,
      mode: 'payment',
      successUrl: 'http://localhost:8080/#/',
      cancelUrl: 'http://localhost:8080/#/',
    ),
  );
}

@JS()
class Stripe {
  external Stripe(String key);

  external redirectToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String sessionId,
  });
}

@JS()
@anonymous
class LineItem {
  external String get price;

  external int get quantity;

  external factory LineItem({String price, int quantity});
}
