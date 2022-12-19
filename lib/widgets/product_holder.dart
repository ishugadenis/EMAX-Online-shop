import 'package:emax_shop_app/screens/specicfic_product_scree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/product.dart';
import '../shared/consts.dart';

class ProductHolder extends StatelessWidget {
  const ProductHolder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: MediaQuery.of(context).size.height * 0.25,
      width: 130,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, SpecificProductScreen.routeName,
              arguments: {
                'productTitle': prod.productName,
                'id': prod.productId
              });
        },
        child: Card(
          color: container_color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  prod.imageUrl,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                color: frame_color,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(prod.productName),
                            Text('Ksh ${prod.price}'),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cart.addItem(prod.productId, prod.price,
                                prod.imageUrl, prod.productName);
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: btn_color,
                          ))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
