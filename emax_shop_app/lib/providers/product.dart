import 'package:flutter/widgets.dart';

class Product with ChangeNotifier {
  final String category;
  final String productId;
  final String productName;
  final int price;
  final String imageUrl;
  final String description;

  Product({
    required this.category,
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.description,
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
        imageUrl:
            'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
        description: '51 inch Tv Flat screen, 4000mgp'),
    Product(
        category: 'Electronics',
        productId: 'p2',
        productName: 'Vitron TV',
        price: 35000,
        imageUrl:
            'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
        description: '51 inch Tv Flat screen, 4000mgp'),
    Product(
        category: 'Electronics',
        productId: 'p3',
        productName: 'Vitron TV',
        price: 35000,
        imageUrl:
            'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
        description: '51 inch Tv Flat screen, 4000mgp'),
    Product(
        category: 'Shoes',
        productId: 'p4',
        productName: 'Adidas',
        price: 3000,
        imageUrl:
            'https://www.transparentpng.com/thumb/adidas-shoes/a4xO3G-adidas-shoes-adidas-shoe-kids-superstar-daddy-grade.png',
        description: 'Size 38, Color white, Double souled'),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((element) => element.productId == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      category: product.category,
      productName: product.productName,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
      productId: DateTime.now().toString(),
    );
    _products.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex =
        _products.indexWhere((element) => element.productId == id);
    if (prodIndex >= 0) {
      _products[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((element) => element.productId == id);
    notifyListeners();
  }
}
