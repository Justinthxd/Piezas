import 'dart:convert';

import 'package:demo_1/data/constants.dart';
import 'package:demo_1/product/product.dart';
import 'package:http/http.dart' as http;

class Server {
  Server();

  Future addProduct(String name, String price, String description) async {
    http.post(
      Uri.parse("https://api.stripe.com/v1/products"),
      body: {
        "name": name,
        "description": description,
      },
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    ).then(
      (http.Response response) {
        final data = jsonDecode(response.body);
        setPriceProduct(data['id'], price);
      },
    );
  }

  Future setPriceProduct(String idProduct, String amount) async {
    http.post(
      Uri.parse("https://api.stripe.com/v1/prices"),
      body: {
        "unit_amount": amount + "00",
        "currency": "dop",
        "product": idProduct,
      },
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    );
  }

  Future getProducts() async {
    List<Product> list = [];

    final products = await http.get(
      Uri.parse("https://api.stripe.com/v1/products"),
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    );

    final prices = await http.get(
      Uri.parse("https://api.stripe.com/v1/prices"),
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    );

    var productsData = json.decode(products.body);
    // print(productsData);
    var pricesData = json.decode(prices.body);
    // print(pricesData);

    for (var item in productsData['data']) {
      list.add(
        Product(
          id: item['id'],
          name: item['name'],
          idPrice: '',
          price: '',
          description: item['description'],
        ),
      );
    }

    for (var item in productsData['data']) {
      for (var price in pricesData['data']) {
        if (item['id'] == price['product']) {
          for (var element in list) {
            if (element.id == item['id']) {
              element.idPrice = price['id'];
              element.price = (price['unit_amount'] / 100).toString();
            }
          }
        }
      }
    }

    return list;
  }

  Future getPrice(String id) async {
    final response = await http.get(
      Uri.parse("https://api.stripe.com/v1/prices"),
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    );

    var data = json.decode(response.body);

    for (var item in data['data']) {
      if (item['product'] == id) {
        return item['unit_amount'];
      }
    }
  }

  Future addTransfer(String idAccount, String amount) async {
    http.post(
      Uri.parse("https://api.stripe.com/v1/transfers"),
      body: {
        "amount": amount + "00",
        "currency": "usd",
        "destination": idAccount,
        "transfer_group": "ORDER_95",
      },
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    ).then(
      (http.Response response) {
        print(response.body);
      },
    );
  }

  Future updateAccount(String idAccount) async {
    http.post(
      Uri.parse("https://api.stripe.com/v1/accounts/$idAccount"),
      body: {
        "tos_acceptance[service_agreement]": "recipient",
      },
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    ).then(
      (http.Response response) {
        print(response.body);
      },
    );
  }

  Future addAccount() async {
    http.post(
      Uri.parse("https://api.stripe.com/v1/accounts"),
      body: {
        "type": "custom",
        "country": "DO",
        "capabilities[transfers][requested]": "true",
        "tos_acceptance[service_agreement]": "recipient",
      },
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    ).then(
      (http.Response response) {
        print(response.body);
      },
    );
  }

  Future addAccountRequeriments() async {
    http.post(
      Uri.parse("https://api.stripe.com/v1/accounts/acct_1KjQ3S2VsuxaoQy3"),
      body: {
        "tos_acceptance[date]": "1609798905",
        "tos_acceptance[ip]": "8.8.8.8",
      },
      headers: {
        "Authorization": 'Bearer $secretKey',
      },
    ).then(
      (http.Response response) {
        print(response.body);
      },
    );
  }
}
