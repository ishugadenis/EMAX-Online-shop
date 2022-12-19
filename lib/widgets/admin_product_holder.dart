import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/editproduct_screen.dart';

class AdminProductHolder extends StatelessWidget {
  const AdminProductHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: double.infinity,
      height: 100,
      child: Row(children: [
        Image.network(
          prod.imageUrl,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(prod.productName),
              Text('Ksh:${prod.price}'),
              Text(prod.description)
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routeName,
                  arguments: prod.productId);
            },
            icon: const Icon(Icons.edit))
      ]),
    );
  }
}
