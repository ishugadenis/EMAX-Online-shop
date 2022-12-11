import 'package:flutter/widgets.dart';

class Category with ChangeNotifier {
  final String category;
  final String id;

  Category({
    required this.category,
    required this.id,
  });
}

class Categories with ChangeNotifier {
  final List<Category> _cat = [
    Category(category: 'Electronics', id: ' C1'),
    Category(category: 'Shoes', id: 'C2'),
    Category(category: 'Shirts', id: 'c3')
  ];

  List<Category> get cat {
    return [..._cat];
  }


}
