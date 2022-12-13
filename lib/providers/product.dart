import 'package:flutter/widgets.dart';

class Product with ChangeNotifier {
  final String category;
  final String productId;
  final String productName;
  final int price;
  final String imageUrl;

  Product({
    required this.category,
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
  });
}

class ProductList with ChangeNotifier {
  // ignore: prefer_final_fields, unused_field
  List<Product> _products = [
    Product(
        category: 'Electronics',
        productId: 'p1',
        productName: 'Vitron TV',
        price: 35000,
        imageUrl: 'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png'),
    Product(
        category: 'Electronics',
        productId: 'p2',
        productName: 'Vitron TV',
        price: 35000,
        imageUrl: 'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png'),
    Product(
        category: 'Electronics',
        productId: 'p3',
        productName: 'Vitron TV',
        price: 35000,
        imageUrl: 'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png'),
  ];

  List<Product> get products {
    return [..._products];
  }
}
