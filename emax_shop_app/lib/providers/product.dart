import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String category;
  final String productId;
  final String productName;
  final double price;
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
    // Product(
    //     category: 'Electronics',
    //     productId: 'p1',
    //     productName: 'Vitron TV',
    //     price: 35000,
    //     imageUrl:
    //         'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
    //     description: '51 inch Tv Flat screen, 4000mgp'),
    // Product(
    //     category: 'Electronics',
    //     productId: 'p2',
    //     productName: 'Vitron TV',
    //     price: 29000,
    //     imageUrl:
    //         'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
    //     description: '51 inch Tv Flat screen, 4000mgp'),
    // Product(
    //     category: 'Electronics',
    //     productId: 'p3',
    //     productName: 'Vitron TV',
    //     price: 35000,
    //     imageUrl:
    //         'https://www.pngall.com/wp-content/uploads/5/Full-HD-LED-TV-PNG-Download-Image.png',
    //     description: '51 inch Tv Flat screen, 4000mgp'),
    // Product(
    //     category: 'Shoes',
    //     productId: 'p4',
    //     productName: 'Adidas',
    //     price: 3000,
    //     imageUrl:
    //         'https://www.transparentpng.com/thumb/adidas-shoes/a4xO3G-adidas-shoes-adidas-shoe-kids-superstar-daddy-grade.png',
    //     description: 'Size 38, Color white, Double souled'),
  ];

  final String authToken;
  ProductList(this.authToken, this._products);

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((element) => element.productId == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url =
        'https://emax-shop-default-rtdb.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
            productId: prodId,
            productName: prodData['productName'] ?? '',
            category: prodData['category'] ?? '',
            description: prodData['descrption'] ?? '',
            imageUrl: prodData['imageUrl'] ?? '',
            price: prodData['price'] ?? 0.0));
      });
      _products = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://emax-shop-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'productName': product.productName,
            'category': product.category,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'descrption': product.description,
            //'id': product.productId
          }));
      print(json.decode(response.body));
      final newProduct = Product(
        category: product.category,
        productName: product.productName,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
        productId: json.decode(response.body)['name'],
      );
      _products.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex =
        _products.indexWhere((element) => element.productId == id);
    if (prodIndex >= 0) {
      final url =
          'https://emax-shop-default-rtdb.firebaseio.com/products/$id.json';
      try {
        await http.patch(Uri.parse(url),
            body: json.encode({
              'productName': newProduct.productName,
              'category': newProduct.category,
              'price': newProduct.price,
              'imageUrl': newProduct.imageUrl,
              'descrption': newProduct.description,
            }));
        _products[prodIndex] = newProduct;
        notifyListeners();
      } catch (error) {
        throw error;
      }
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    final url =
        'https://emax-shop-default-rtdb.firebaseio.com/products/$id.json';
    final existingProductIndex =
        _products.indexWhere((element) => element.productId == id);
    Product? existingProduct = _products[existingProductIndex];
    // _products.removeWhere((element) => element.productId == id);
    _products.removeAt(existingProductIndex);
    notifyListeners();
    http.delete(Uri.parse(url)).then((_) {
      existingProduct = null;
    }).catchError((_) {
      _products.insert(existingProductIndex, existingProduct!);
    });
    notifyListeners();
  }
}
