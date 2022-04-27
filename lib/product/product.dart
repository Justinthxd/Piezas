class Product {
  String id;
  String name;
  String idPrice;
  String price;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.idPrice,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      idPrice: json['id_price'],
      price: json['price'],
      description: json['description'],
    );
  }
}
