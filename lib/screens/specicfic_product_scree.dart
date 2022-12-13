import 'package:flutter/material.dart';

class SpecificProductScreen extends StatelessWidget {
  const SpecificProductScreen({Key? key}) : super(key: key);

  static const routeName ='./specificScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('EMAX',style: TextStyle(
                color: Color(0xDBC4A6A6), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xDBf6f6f6),
      actions: const[
        Icon(
            Icons.shopping_cart,
            size: 25,
            color: Color(0xDBc4a6a6),
          )
      ],
    ),);
  }
}