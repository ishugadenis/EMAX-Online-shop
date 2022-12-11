import 'package:emax_shop_app/shared/consts.dart';
import 'package:flutter/services.dart';

import '../providers/orders.dart';
import '../widgets/app_drawer.dart';
import '../widgets/cart_item_holder.dart';
import 'package:flutter/material.dart';
import '../providers/cart_provider.dart' show Cart;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = './cart-screen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: appBar_color,
        statusBarIconBrightness: Brightness.dark));
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: appBar_color,
        title: const Text('EMAX'),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (context, i) => CartItemHolder(
                    cart.items.values.toList()[i].productName,
                    cart.items.values.toList()[i].price,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].id,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].imageUrl,
                  )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: appBar_color,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(children: [
                const Text(
                  "Total amount",
                ),
                const Spacer(),
                Text('Ksh ${cart.totalAmount}'),
                FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen:false).addOrder( cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(color: Colors.amberAccent),
                    ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
