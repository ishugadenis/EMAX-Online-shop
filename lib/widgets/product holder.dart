// ignore_for_file: file_names, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../shared/consts.dart';

class ProductHolder extends StatelessWidget {
  // const ProductHolder({Key? key}) : super(key: key);
  Product product;
  ProductHolder({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.35,
      child: Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height * 0.25 ,
            decoration: const BoxDecoration(
                color: container_color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Image.network(prod.imageUrl,
                alignment: Alignment.center, fit: BoxFit.cover),
          ),
          Container(
            color: frame_color,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(prod.productName),
                      Text(prod.price.toString())
                    ],
                  ),
                  const Icon(
                    Icons.shopping_cart,
                    color: iconbtn_color,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
